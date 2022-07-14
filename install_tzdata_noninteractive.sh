#!/usr/bin/env sh
# taken from https://stackoverflow.com/a/44333806
export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata
