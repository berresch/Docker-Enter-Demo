# Docker Demo #

This demo gives an introduction on how to enter running [Docker][docker] containers. Please see my [blog post][cc-blog] for details.

The demo shows 4 options to enter a running container:

1. ssh
2. nsenter
3. nsinit
4. lxc-attach

For each demo exists a directory with at least 2 scripts `install.sh` and `docker-enter.sh`. The `install` script installs all necessary dependencies and the `docker-enter` script will connect you with the running test container. For more details see chapter 2 `Run Demo`

Feel free to contact me for any questions or comments.

## Prerequisites ##

Docker builds upon [Linux Containers][lxc] (LXC) and thus only runs on Linux. In order to allow you to also play with Docker on non-Linux machines, there are two ways to run this demo, i.e., inside a [Vagrant Box][vagrant] or directly on Linux. Please see the respective subsections below.

### Vagrant Box ###

If you decide to run the demo inside a Vagrant box, please install Vagrant accordingly. The Vagrantfile provided requires Vagrant version 1.4.0 or higher, because starting from that version Docker can be automatically installed. As provider, VirtualBox is assumed. Once Vagrant is installed, just run
> `vagrant up; vagrant ssh`

> `cd /vagrant`

in the root directory. Then follow the same instructions as for native Linux.

### Native Linux  ###

If you decide to run the demo on a native Linux, please install Docker according to your distribution. There are How-Tos for many different distributions in the Docker [documentation][docker-install-doc].

## Running the Demo ##

### 1. Build test container ###

In the first step we need a test container that we can enter. In the `docker` directory exists a `Dockerfile` that builds an ubuntu 13.04 image. When a container of that image is started a sshd process will be started via supervisord. To build and start the test container, just run
> `cd /vagrant/docker`

> `./run.sh`

Now you should see the running container named supervisord via
> `docker ps`

### 2. Run Demo ###

#### ssh ####

In order to enter the test container via ssh, just run
> `cd /vagrant/ssh`

> `./install.sh`

> `./docker-enter.sh`

#### nsenter ####

In order to enter the test container via nsenter, just run
> `cd /vagrant/nsenter`

> `./install.sh`

> `sudo su -`

> `cd /vagrant/nsenter`

> `./docker-enter.sh`

#### nsinit ####

In order to enter the test container via nsinit, just run
> `sudo su -`

> `cd /vagrant/nsinit`

> `./install.sh`

Now you have to log out and log in as root again because we set some environment variables for go-lang. Afterwards just run

> `./docker-enter.sh`

#### lxc-attach ####

In order to enter the test container via lxc-attach, just run
> `cd /vagrant/lxc-attach`

> `./install.sh`

> `sudo su -`

> `./start-docker-lxc.sh`

> `./docker-enter.sh`

If you want to run the docker daemon in default mode again, just run
> `./start-docker-default.sh`

[docker]: http://docker.io
[cc-blog]: https://blog.codecentric.de/en/
[lxc]: http://linuxcontainers.org/
[vagrant]: http://www.vagrantup.com
[docker-install-doc]: http://docs.docker.io/en/latest/installation/
