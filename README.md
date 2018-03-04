**My Linux Environment**

## Why?

* I am tired of switching laptop and having to configure Vagrant again.

* There are basic things that I am tired installing again and again. E.g. Docker, Go, Cassandra.

* I want to have a basic Vagrant template that I can copy over to per-project basis.


## As another Git user, how can I use this?

Just fork this repo and add you own stuff.


## Prerequisites

* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

* Install [Vagrant](https://www.vagrantup.com/downloads.html)


## Install Instructions

```
cd ~
git clone git@github.com:didip/mylinux.git

cd mylinux
vagrant up ubuntu  # for Ubuntu
vagrant up rhel7   # for RHEL7
```
