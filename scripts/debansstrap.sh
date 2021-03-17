#!/bin/bash
# enable host for ansible
set -e
PUBKEY="ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAEKiJyguZ21oodAe/i9EcvU5zv3eKX1LnmtcyEa1yFZ8DTokA9UTEPHxpcmOqJ04N5tPt3IRTsHRSTB83bMqMrvCQFxIUH+ybZp4LwL6XHw12mPranWDuFez1FMLZrVz8N+Z2H+7BSVySGGEUojo1pVBXMGm0cejdDj5v//mgYLGjosSQ== studo@USTACHOWIAKNB02"
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
