#!/bin/sh 
export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

./valheim/valheim_server.x86_64 -name $1 -port 2456 -nographics -batchmode -world $2 -password $3 -public 0  
export LD_LIBRARY_PATH=$templdpath