#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl puppet git apt-transport-https ca-certificates 

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list

apt-get -y install docker-engine 

usermod -aG docker vagrant

service docker start

curl -sSL https://get.rvm.io | bash -s stable

usermod -a -G rvm vagrant

source /etc/profile.d/rvm.sh

rvm install ruby-2.2.0

# You can install anything you need here.
