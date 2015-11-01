#! /bin/bash
# Name : install.sh
# Func : install wide-dhcpv6-server
# Time : 2015-11-01 13:52:57

sudo apt-get install wide-dhcpv6-server
sudo cp ./wide-dhcpv6/ /etc/ -rf
sudo service wide-dhcpv6-server restart
