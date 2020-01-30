FROM ubuntu

ENV STEAMCMDDIR="/home/steam/steamcmd" \
    STEAMAPPID=343050 \
    STEAMAPPDIR="/home/steam/dst" \
    DSTCONFIGDIR="/home/steam/.klei/DoNotStarveTogether" \
    MODCONFIGDIR="/home/steam/mods"

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
WORKDIR ${STEAMAPPDIR}/bin
VOLUME ["${STEAMCMDDIR}", "${STEAMAPPDIR}", "${DSTCONFIGDIR}", "${MODCONFIGDIR}"]

RUN cd ${STEAMCMDDIR} \
    && wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf -
    && ./steamcmd.sh +login anonymous \
      +force_install_dir ${STEAMAPPDIR} \
      +app_update ${STEAMAPPID} validate \
      +quit \
    && rm -f ${STEAMAPPDIR}/mods/dedicated_server_mods_setup.lua \
    && cp -f ${MODCONFIGDIR}/dedicated_server_mods_setup.lua ${STEAMAPPDIR}/mods \
    && cd ${STEAMAPPDIR}/bin \
    && ./dontstarve_dedicated_server_nullrenderer -only_update_server_mods

CMD ["./dontstarve_dedicated_server_nullrenderer", "-console", "-cluster", "Cluster_1", "-shard", "Master"]
