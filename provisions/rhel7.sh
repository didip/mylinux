#!/bin/bash

yum -y update

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2 \
  git \
  wget \
  libtool-ltdl \
  libcgroup \
  container-selinux

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum-config-manager --enable docker-ce-edge

yum -y install docker-ce


# -----------------------------------------------
# Userspace tools
# -----------------------------------------------

yum -y install golang

# Setup Go
export GOPATH=/go
rm -rf $GOPATH/pkg/linux_amd64
echo 'export GOPATH=/go' > /etc/profile.d/go.sh
echo 'export PATH=$GOPATH/bin:$PATH' >> /etc/profile.d/go.sh

# Install Java
cd /tmp
wget --no-cookies --no-check-certificate \
	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.rpm"
yum -y install jdk-9.0.4_linux-x64_bin.rpm
cd $OLDPWD
rm -rf /tmp/jdk-9.0.4_linux-x64_bin.rpm


# -----------------------------------------------
# Userspace databases
# -----------------------------------------------

cat >/etc/yum.repos.d/cassandra.repo <<EOL
[cassandra]
name=Apache Cassandra
baseurl=https://www.apache.org/dist/cassandra/redhat/311x/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.apache.org/dist/cassandra/KEYS
EOL

yum install -y cassandra
