#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH

steamcmd +login anonymous +app_update 2394010 validate +quit

cd ~/Steam/steamapps/common/PalServer
./PalServer.sh port=${GAME_PORT} players=32 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS	EpicApp=PalServer

export LD_LIBRARY_PATH=$templdpath

echo "Server started"