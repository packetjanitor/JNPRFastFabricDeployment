To deploy ospf: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml
To remove ospf: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/ospf-remove.yml

Files and directories:
all.inv - This is the inventory file for the devices. I use a full inventory file to make it simple rather than making small groups and then calling each of them.       
junos_health_check-dual.yml - This health check verifies netconf connectivity and displays the software version of the device.
junos_route_table_check-2.yml - This YAML file can be used to verify the routing table from Ansible.
ansible.cfg - Ansible has a few parameters that are most easily set in each directory to avoid path conflicts.
deploy-ospf.yml - This file is the template that Ansible uses to deploy the overlay.
ospf-remove.yml - This file is the template that Ansible uses to deploy the overlay.
roles - This directory is where Juniper.junos lives and provides the Ansible integration into Junos
leaf.set - This is command line automation. It configures OSPF on the Leaf devices.
spine.set - This is command line automation. It configures OSPF on the Spine devices.
remove.set - This is command line automation. This removes OSPF from all devices.

You can learn more about the Juniper configuration at:
https://www.juniper.net/documentation/en_US/junos/topics/example/evpn-vxlan-qfx5110-l3-vxlan-gateway-collapsed.html
https://www.juniper.net/us/en/training/jnbooks/day-one/fundamentals-series/routing-internet-protocol/
