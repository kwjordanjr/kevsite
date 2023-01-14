# this is all the stuff that we used to build our original image
FROM bitnami/minideb:bullseye

# download dev packages that aren't included in minideb
RUN sudo apt-get update -y && \
    sudo apt-get install -y ncurses-bin \
    sudo apt-get install -y build-essential 

# download python3 and pip3 for the linode-cli
#  this stuff is only needed for deployment pipeline
RUN sudo apt-get update -y && \
    sudo apt-get install -y python3 && \
    sudo apt-get install -y python3-pip && \
    sudo pip3 install linode-cli

# we need to copy our files into this image

# we need to build this image and output the binary

# now we have the distroless image that we will actually be deploying 
FROM gcr.io/distroless/static-debian11

# we need to copy in the built golang binary

# we need to run our binary, expose whatever ports are needed

