#!/usr/bin/env bash

source $HOME/.rvm/scripts/rvm

rvm install 2.2.0 > /dev/null 2>&1
chmod 777 -R /usr/local/rvm/gems/ruby-2.2.0
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get install -y apt-transport-https ca-certificates
apt-get update
apt-get install -y linux-image-extra-$(uname -r) apparmor docker-engine

groupadd docker
gpasswd -a vagrant docker
service docker restart


rvm cleanup all
