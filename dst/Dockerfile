FROM debian:buster-slim

ENV STEAMCMDDIR /home/steam/steamcmd
ENV STEAMAPPID 343050
ENV STEAMAPPDIR /home/steam/dst
ENV DSTCONFIGDIR /home/steam/.klei/DoNotStarveTogether

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      ca-certificates \
      libstdc++6:i386 \
      libgcc1:i386 \
      libcurl4-gnutls-dev:i386 \
    && useradd -m steam

USER steam
WORKDIR /home/steam

RUN mkdir -p ${STEAMCMDDIR} \
    && mkdir -p ${STEAMAPPDIR} \
    && mkdir -p ${DSTCONFIGDIR} \
    && cd ${STEAMCMDDIR} \
    && wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf -

VOLUME ["${STEAMCMDDIR}", "${STEAMAPPDIR}", "${DSTCONFIGDIR}"]
