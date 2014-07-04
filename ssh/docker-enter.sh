#!/bin/bash

IP=$(docker inspect --format "{{ .NetworkSettings.IPAddress }}" supervisord)
sshpass -p demo ssh -o StrictHostKeyChecking=no root@$IP
