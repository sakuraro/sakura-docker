FROM cm2network/steamcmd:root

ENV STEAMAPPID 343050
ENV STEAMAPPDIR /home/steam/dontstarvetogether_dedicated_server
ENV DONTSTARVEDIR /home/steam/.klei/DoNotStarveTogether
ENV CLUSTERNAME MyDediServer

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      wget \
      ca-certificates \
      libcurl4-gnutls-dev:i386 \
    # && useradd -m steam \
    && su steam -c \
      "${STEAMCMDDIR}/steamcmd.sh \
        +login anonymous \
        +force_install_dir ${STEAMAPPDIR} \
        +app_update ${STEAMAPPID} validate \
        +quit \
      && { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir ${STEAMAPPDIR}'; \
        echo 'app_update ${STEAMAPPID}'; \
        echo 'quit'; \
      } > ${STEAMAPPDIR}/dst_update.txt \
      && cd ${STEAMAPPDIR} \
      && wget https://accounts.klei.com/assets/gamesetup/linux/run_dedicated_servers.sh \
      && chmod u+x ./run_dedicated_servers.sh" \
    && apt-get autoremove --purge -y \
      wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

USER steam
WORKDIR $STEAMAPPDIR
VOLUME ["${STEAMAPPDIR}", "${DONTSTARVEDIR}"]

ENTRYPOINT ${STEAMCMDDIR}/steamcmd.sh \
    +login anonymous \
    +force_install_dir ${STEAMAPPDIR} \
    +app_update ${STEAMAPPID} \
    +quit \
  && ${STEAMAPPDIR}/run_dedicated_servers.sh \
    -console \
    -cluster "${CLUSTERNAME}" \
    -shard Master
