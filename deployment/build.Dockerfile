# this is all the stuff that we used to build our original image
FROM bitnami/minideb:bullseye as build

# download dev packages that aren't included in minideb
RUN apt-get update -y && \
    apt-get install -y ncurses-bin && \
    apt-get install -y build-essential && \
    apt-get install -y wget 

# download go
RUN rm -rf /usr/local/go && \
    wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz

ENV PATH=${PATH}:/usr/local/go/bin

# download nodeJS
RUN wget -q https://nodejs.org/dist/v18.3.0/node-v18.3.0-linux-x64.tar.xz \
    && tar -xJvf node-v18.3.0-linux-x64.tar.xz -C /usr/local --strip-components=1 \
    && rm node-v18.3.0-linux-x64.tar.xz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# download yarn
RUN npm install -g yarn

# copy in our files to be built
COPY . .

# set gin build to 'release' and build
ENV GIN_MODE=RELEASE
RUN CGO_ENABLED=0 go build -installsuffix cgo -o app 

RUN cd ./frontend &&
    yarn build 

# now we have the distroless image that we will actually be deploying 
FROM gcr.io/distroless/static-debian11

# expose container port
EXPOSE 9000

# we need to copy in the built golang binary
COPY --from=0 /app ./

# also copy in the frontend
COPY --from=0 /frontend/build ./frontend/build

# run our program
CMD ["./app"]
