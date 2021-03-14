#!/bin/bash
# enable host for ansible
set -e
PUBKEY=""
id -u ansible > /dev/null 2>&1 || \
adduser ansible --disabled-password \
--gecos "" --quiet
mkdir -p /home/ansible/.ssh
echo "$PUBKEY" \
> /home/ansible/.ssh/authorized_keys
chown -R ansible /home/ansible/.ssh
apt-get update
apt-get install sudo
grep -q ansible /etc/sudoers || \
echo "ansible ALL = (ALL) \
NOPASSWD: ALL" >> /etc/sudoers
