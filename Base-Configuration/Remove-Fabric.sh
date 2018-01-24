#!/bin/bash
# Fabric removal for OSPF Underlay and EVPN/VXLAN Overlay
ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/overlay-remove.yml
sleep 10
ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/ospf-remove.yml
sleep 10
ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/address-remove.yml
