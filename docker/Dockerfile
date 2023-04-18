FROM steamcmd/steamcmd:latest

RUN set -ex; \
    apt-get update -y;  \
    apt-get upgrade -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN mkdir valheim

RUN steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir /valheim +login anonymous +app_update 896660 -beta none validate +quit

COPY ./start_server.sh .

EXPOSE 2456-2458

ENTRYPOINT [ "start_server.sh" ]