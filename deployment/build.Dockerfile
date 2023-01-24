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

COPY . .

RUN CGO_ENABLED=0 go build -installsuffix cgo -o app 

# now we have the distroless image that we will actually be deploying 
FROM gcr.io/distroless/static-debian11

# expose container port
EXPOSE 9000

# we need to copy in the built golang binary
COPY --from=0 /app ./

# also copy in the frontend

COPY --from=0 /frontend ./frontend

# run our program
CMD ["./app"]
