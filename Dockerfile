FROM ubuntu:latest

MAINTAINER mikebeetv

RUN mkdir -p /volume1/ArkServer
RUN cd /volume1/ArkServer

#
# Setup the server and delete stuff you don't need
#
RUN apt-get update \
    && apt-get -y install lib32gcc1 wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && mkdir -p /volume1/ArkServer/backup \
    && useradd -d /volume1/ArkServer -s /bin/bash --uid 1000 ark \
    && chown -R ark: /volume1/ArkServer

#
# You can't set these in your Synology DS due to a bug
#
EXPOSE 27015/udp 7778/udp
EXPOSE 32330/tcp

ADD ark_server.sh /usr/local/bin/ark_server
ADD enable_rcon /volume1/ArkServer/enable_rcon 

USER ark
VOLUME /volume1/ArkServer
WORKDIR /volume1/ArkServer
CMD ["ark_server"]
