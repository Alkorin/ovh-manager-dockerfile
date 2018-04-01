FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget xz-utils curl gnupg apt-transport-https git make bzip2 nano

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install -y --no-install-recommends yarn

RUN groupadd -g 1000 user && useradd -u 1000 -g 1000 -s /bin/bash user && mkdir -m 700 /home/user && chown user:user /home/user

USER user
WORKDIR /home/user

ENV PATH="/home/user/node-v9.8.0-linux-x64/bin:${PATH}"
RUN wget https://nodejs.org/dist/v9.8.0/node-v9.8.0-linux-x64.tar.xz && tar xvf node-v9.8.0-linux-x64.tar.xz && npm install -g grunt-cli && rm node-v9.8.0-linux-x64.tar.xz
RUN mkdir ssl && cd ssl && openssl genrsa -out server.key 4096 && openssl req -x509 -key server.key -out server.crt -days 3650 -subj "/CN=ovh-dev-manager"
