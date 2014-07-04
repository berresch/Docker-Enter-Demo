#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be root to execute this script" 2>&1
else
  PID=$(docker inspect --format "{{ .State.Pid }}" supervisord)
  nsenter --target $PID --mount --uts --ipc --net --pid
fi
