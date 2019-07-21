#!/bin/sh
echo $SERVER_OP > /minecraft/ops.txt
tmux new-session -d -s tekkit "java $JAVA_ARGS -jar Tekkit.jar nogui"
sleep 2
tail -f /minecraft/server.log
