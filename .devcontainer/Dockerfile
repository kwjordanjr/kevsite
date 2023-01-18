FROM bitnami/minideb:bullseye

# download packages that aren't included in minideb
RUN apt-get update -y && \
    apt-get install -y ncurses-bin && \
    apt-get install -y build-essential && \
    apt-get install -y wget 

# download go
RUN rm -rf /usr/local/go && \
    wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz

ENV PATH=${PATH}:/usr/local/go/bin

ENV PORT=":9000"
