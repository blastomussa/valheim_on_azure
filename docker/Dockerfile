FROM ubuntu:jammy

RUN set -ex; \
    apt-get update -y;  \
    apt-get upgrade -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN echo steam steam/license note '' | debconf-set-selections; \
    echo steam steam/question select "I AGREE" | debconf-set-selections;

RUN add-apt-repository ; \
    apt install software-properties-common; \
    dpkg --add-architecture i386; \
    apt update; \
    apt install -y lib32gcc-s1 ca-certificates steamcmd; 

RUN mkdir valheim

RUN /usr/games/steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir /valheim +login anonymous +app_update 896660 -beta none validate +quit

COPY ./start_server.sh .

EXPOSE 2456-2458

ENTRYPOINT [ "start_server.sh" ]