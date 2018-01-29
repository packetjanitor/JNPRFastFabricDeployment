#!/bin/bash
# Fabric deployment for OSPF Underlay and EVPN/VXLAN Overlay
# Comannd example ./Build-Fabric-silent.sh 
# Tested on Linux 4.4.0-109-generic #132-Ubuntu 
# Date written 2018 January 24

printf "Fabric initialization begins.\n"
sleep 3
ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml > /dev/null
printf "Addresses applied.\n"
sleep 3
ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml > /dev/null
printf "OSPF Routing Protocol installed.\n"
sleep 3
ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml > /dev/null
sleep 3
printf "Overlay deployed.\n"
sleep 3
printf "Letting the hardware form adjacencies and stabilize.\n"
sleep 3
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Countdown to Fabric Availability: "
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done
sleep 3
printf "\n\nThe Fabric is ready.\n"
