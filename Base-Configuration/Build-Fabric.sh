#!/bin/bash
# Fabric deployment for OSPF Underlay and EVPN/VXLAN Overlay
# Comannd example ./Build-Fabric.sh
# Tested on Linux 4.4.0-109-generic #132-Ubuntu
# Date written 2018 January 24
printf  "Fabric initialization begins\r"
ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml
printf  "Addresses applied\r"
sleep 3
ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml
printf "OSPF Routing Protocol installed\r"
sleep 3
ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml
printf  "Overlay deployed\r"
printf "Letting the hardware catch up to the software world.\r"
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Countdown to Fabric Availability: "
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done
