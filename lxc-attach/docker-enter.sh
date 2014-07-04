#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be root to execute this script" 2>&1
else
  CID=$(docker inspect --format "{{ .Id }}" supervisord)
  lxc-attach -n $CID -- /bin/bash
fi
