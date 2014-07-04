#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be root to execute this script" 2>&1
else
  apt-get install -y git golang-go

  mkdir -p $HOME/go-dev/bin
  mkdir -p $HOME/go-dev/src

  echo "export GOPATH=\$HOME/go-dev" >> $HOME/.profile
  echo "PATH=\$PATH:\$GOPATH/bin" >> $HOME/.profile
  source ~/.profile

  GOPATH=$HOME/go-dev
  
  mkdir -p $GOPATH/src/github.com/dotcloud
  cd $GOPATH/src/github.com/dotcloud

  git clone https://github.com/dotcloud/docker.git
  cd $GOPATH/src/github.com/dotcloud/docker

  /usr/bin/go get -v github.com/dotcloud/docker/vendor/src/github.com/docker/libcontainer/nsinit
fi
