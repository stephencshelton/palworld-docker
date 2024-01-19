FROM steamcmd/steamcmd:latest

LABEL maintainer="sshelton@amivero.com"

ENV DATA_DIR="/serverdata"
ENV STEAMCMD_DIR="/root/.steam/steamcmd"
ENV SERVER_DIR="${DATA_DIR}/serverfiles"
ENV GAME_ID="2394010"
ENV GAME_PARAMS=""
ENV WORLD_NAME="Dedicated"
ENV SRV_PWD="Docker"
ENV PUBLIC=1
ENV GAME_PORT=8211
ENV VALIDATE=""
ENV USERNAME="anonymous"
ENV PASSWRD=""
ENV USER="steam"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && mkdir $SERVER_DIR

RUN mkdir /opt/scripts/
ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

EXPOSE 8211/udp

#Server Start
ENTRYPOINT ["/opt/scripts/start_server.sh"]