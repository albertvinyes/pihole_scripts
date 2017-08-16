#!/bin/sh
if [ "$(id -u)" != "0" ] ;
  then echo -e "\e[31m Please run as root!"
  exit
fi

echo -n "Disabling local DNS Server..."
sudo sed -e '/dns/ s/^#*/#/' -i /etc/NetworkManager/NetworkManager.conf
sleep 1
echo -e "\e[34m Done!\e[0m"

echo -n "Restarting Network Manager..."
which service > /dev/null 2>&1
if [ $? -eq "0" ] ;
    # System using services
    then service network-manager restart > /dev/null 2>&1
fi
which systemctl > /dev/null 2>&1
if [ $? -eq "0" ] ;
    # System using systemctl
    then systemctl restart NetworkManager > /dev/null 2>&1
fi
echo -e "\e[34m Done!\e[0m"
