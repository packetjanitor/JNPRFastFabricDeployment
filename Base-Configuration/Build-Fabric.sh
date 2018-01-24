#!/bin/bash
# Fabric removal for OSPF Underlay and EVPN/VXLAN Overlay
#echo -n "Fabric initialization begins"
#{
#do
ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml
sleep 10
ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml
sleep 10
ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml
#done
#} >/dev/null 2>&1
secs=$((3 * 60))
while [ $secs -gt 0 ]; do
   echo -ne "Countdown to Fabric Availability: "
   echo -ne "$secs\033[0K\r"
   sleep 1
   : $((secs--))
done
#ansible-playbook -i 04-Routing/OSPF/all.inv -e '{ "CMD": "show bgp summary | grep Estab " }' 04-Routing/OSPF/junos_route_table_check-2.yml
