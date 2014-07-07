#!/bin/bash -e

sudo docker build -t demo/supervisord /vagrant/docker

echo 'Starting supervisord container...'
sudo docker run -d --name supervisord demo/supervisord
