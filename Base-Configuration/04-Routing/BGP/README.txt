To deploy BGP: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/bgp/all.inv 04-Routing/bgp/deploy-bgp.yml
To remove BGP: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/bgp/all.inv 04-Routing/bgp/bgp-remove.yml

Files and directories:
all.inv - This is the inventory file for the devices. I use a full inventory file to make it simple rather than making small groups and then calling each of them.       
junos_health_check-dual.yml - This health check verifies netconf connectivity and displays the software version of the device.
junos_route_table_check-2.yml - This YAML file can be used to verify the routing table using Ansible.
ansible.cfg - Ansible has a few parameters that are most easily set in each directory to avoid path conflicts.
deploy-isis.yml - This file is the template that Ansible uses to deploy isis as the underlay routing protocol.
isis-remove.yml - This file is the template that Ansible uses to remove isis as the underlay routing protocol.
roles - This directory is where Juniper.junos lives and provides the Ansible integration into Junos
leaf.set - This is command line automation. It configures ISIS on the Leaf devices.
spine.set - This is command line automation. It configures ISIS on the Spine devices.
remove-isis.set - This is command line automation. This removes ISIS from all devices.
configisis - This is command line automation. This directory houses the configuration files for each device.
removeisis - This is command line automation. This directory houses the files that remove the configuration for each device.

You can learn more about the Juniper configuration at:
https://www.juniper.net/us/en/training/jnbooks/day-one/fundamentals-series/routing-internet-protocol/
