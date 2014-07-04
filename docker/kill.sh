#!/bin/bash

echo 'Stopping and removing supervisord container...'
sudo docker kill supervisord
sudo docker rm supervisord
