#!/bin/bash
# Fabric removal for OSPF Underlay and EVPN/VXLAN Overlay
echo -n "Fabric initialization begins"
ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml
echo -n "Addresses applied"
sleep 10
ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml
echo -n "OSPF Routing Protocol installed"
sleep 10
ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml
echo -n "Overlay deployed"
echo -n "Letting the hardware catch up to the software world. ;)"
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Countdown to Fabric Availability: "
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done
