#! /usr/bin/bash

echo "Fixes WIFI problem" 
echo "based on https://www.ostechnix.com/fix-job-netctl-service-failed-error-arch-linux/"
echo ""

echo "Disable dhcpcd.service"
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
echo ""

echo "Remove old DHCP leases"
ls /var/lib/dhcpcd/
sudo rm -fr /var/lib/dhcpcd/wlp2s0*
echo ""

echo "Delete all unnecessary and previouly enabled services from systemd"
sudo rm /etc/systemd/system/multi-user.target.wants/netctl*

