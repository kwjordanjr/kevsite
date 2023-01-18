# this is all the stuff that we used to build our original image
FROM bitnami/minideb:bullseye

# download dev packages that aren't included in minideb
RUN sudo apt-get update -y && \
    sudo apt-get install -y ncurses-bin \
    sudo apt-get install -y build-essential

# download go
RUN rm -rf /usr/local/go && \
    wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz

ENV PATH=${PATH}:/usr/local/go/bin

# now we have the distroless image that we will actually be deploying 
FROM gcr.io/distroless/static-debian11

# expose container port
ENV PORT=":9000"
# we need to copy in the built golang binary

# we need to run our binary, expose whatever ports are needed

