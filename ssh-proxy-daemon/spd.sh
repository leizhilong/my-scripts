#!/bin/bash
SSH_CMD="ssh -C2TnNfD 1090 -p 22 root@xxxxxxxxxxx"
SPD_PID=$(ps -ef | grep "${SSH_CMD}" | grep -v grep | awk '{print $2}')

if [ -z $SPD_PID ]; then
    echo "SSH Proxy Daemon NOT FOUND, run cmd:$SSH_CMD"
    bash -c "$SSH_CMD" > /dev/null 2>&1
    SPD_PID=$(ps -ef | grep "${SSH_CMD}" | grep -v grep | awk '{print $2}')
    echo "SSH Proxy Daemon PID=$SPD_PID"
else
    echo "SSH Proxy Daemon is already running, PID=$SPD_PID"
fi