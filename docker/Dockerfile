FROM ubuntu:jammy

RUN set -ex; \
    apt-get update -y;  \
    apt-get upgrade -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN echo steam steam/license note '' | sudo debconf-set-selections; \
    echo steam steam/question select "I AGREE" | sudo debconf-set-selections;

RUN add-apt-repository ; \
    apt install software-properties-common; \
    dpkg --add-architecture i386; \
    apt update; \
    apt install -y lib32gcc-s1 steamcmd; 

RUN mkdir valheim

RUN steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir /valheim +login anonymous +app_update 896660 -beta none validate +quit

COPY ./start_server.sh .

EXPOSE 2456-2458

ENTRYPOINT [ "start_server.sh" ]