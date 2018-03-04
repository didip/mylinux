#!/bin/bash

apt-get update -y

apt-get install -y software-properties-common python-setuptools sysstat
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    git \
    python-setuptools \
    sysstat \
    software-properties-common

# Add Docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker
apt-get update -y
apt-get install -y docker-ce


# -----------------------------------------------
# Userspace tools
# -----------------------------------------------

# Install supervisord
apt-get install -y supervisor
easy_install superlance

# Install Go, godeb will install the latest version of Go.
curl https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz | tar zx -C /usr/local/bin
GOPATH=/go godeb install

# Setup Go
export GOPATH=/go
rm -rf $GOPATH/pkg/linux_amd64
echo 'export GOPATH=/go' > /etc/profile.d/go.sh
echo 'export PATH=$GOPATH/bin:$PATH' >> /etc/profile.d/go.sh

# Install Java
add-apt-repository ppa:webupd8team/java
apt-get update -y
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y oracle-java9-installer
apt-get install -y oracle-java9-set-default


# -----------------------------------------------
# Userspace databases
# -----------------------------------------------

# Cassandra
echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
apt-get update -y
apt-get install -y cassandra

