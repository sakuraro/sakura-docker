FROM cm2network/steamcmd:root

ENV STEAMAPPID 343050
ENV STEAMAPPDIR /home/steam/dontstarvetogether_dedicated_server
ENV DONTSTARVEDIR /home/steam/.klei/DoNotStarveTogether

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      ca-certificates \
      libcurl4-gnutls-dev:i386 \
    && apt-get autoremove --purge -y \
      wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
    
RUN su steam -c \
      "${STEAMCMDDIR}/steamcmd.sh \
        +login anonymous \
        +force_install_dir ${STEAMAPPDIR} \
        +app_update ${STEAMAPPID} validate \
        +quit "

USER steam
WORKDIR $STEAMAPPDIR
VOLUME ["${STEAMAPPDIR}", "${DONTSTARVEDIR}"]

ENTRYPOINT ${STEAMAPPDIR}/bin/dontstarve_dedicated_server_nullrenderer
