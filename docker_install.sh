#!/bin/sh
if [ "$(id -u)" != "0" ] ;
  then echo -e "\e[31m Please run as root!"
  exit
fi

curl -sSL https://get.docker.com/ | sh
usermod -aG docker $(whoami)
docker pull diginc/pi-hole
