#!/bin/bash
#

# Install last stable version of LXD
add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
apt update
apt-get install -y lxd zfsutils-linux

# Configure LXD
lxd init --auto --storage-backend zfs --storage-create-loop 50 --storage-pool lxd --trust-password lxd --network-address 0.0.0.0 --network-port 8443

# Configure LXD network
lxc network create lxdbr0
lxc network attach-profile lxdbr0 default eth0

# Create containers
for i in $(seq -f "lxc%02g" 1 3); do lxc launch ubuntu:xenial $i; done

# Configure DNS
BRIDGE_IP=$(lxc network get lxdbr0 ipv4.address | cut -d"/" -f1)
echo "nameserver ${BRIDGE_IP}" >> /etc/resolvconf/resolv.conf.d/head
resolvconf -u

# Install ruby
apt install -y ruby ruby-dev
apt install -y build-essential

# Install XP5K
gem install xp5k

# Configure SSH on containers
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
for i in $(seq -f "lxc%02g" 1 3); do lxc file push /root/.ssh/authorized_keys $i/root/.ssh/authorized_keys; done
printf 'Host *\n  StrictHostKeyChecking=no\n  PasswordAuthentication=no\n  CheckHostIp=no\n' > /root/.ssh/config

