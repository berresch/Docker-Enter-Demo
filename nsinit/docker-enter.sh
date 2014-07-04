#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be root to execute this script" 2>&1
else
  CID=$(docker inspect --format "{{ .Id }}" supervisord)
  cd /var/lib/docker/execdriver/native/$CID && nsinit exec /bin/bash
fi