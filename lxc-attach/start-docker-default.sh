#!/bin/bash

sh /vagrant/docker/kill.sh

sudo service docker stop
sudo cp docker-default /etc/default/docker
sudo service docker start
 
sh /vagrant/docker/run.sh
