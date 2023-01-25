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

# download nodeJS
RUN wget -q https://nodejs.org/dist/v18.3.0/node-v18.3.0-linux-x64.tar.xz \
    && tar -xJvf node-v18.3.0-linux-x64.tar.xz -C /usr/local --strip-components=1 \
    && rm node-v18.3.0-linux-x64.tar.xz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# download yarn
RUN npm install -g yarn

ENV PATH=${PATH}:/usr/local/go/bin
