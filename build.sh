#!/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt update -y
apt install -y git build-essential libssl-dev pkg-config libnl-3-dev libnl-genl-3-dev

git clone --branch hostap_2_10 git://w1.fi/srv/git/hostap.git

cd hostap
git apply ../hostapd_2_10-wpe.patch
cd hostapd
make