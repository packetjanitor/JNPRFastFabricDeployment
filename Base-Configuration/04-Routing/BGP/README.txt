To deploy BGP: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/BGP/all.inv 04-Routing/BGP/deploy-bgp.yml
To remove BGP: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 04-Routing/BGP/all.inv 04-Routing/BGP/bgp-remove.yml

Files and directories:
all.inv - This is the inventory file for the devices. 
junos_health_check-dual.yml - This health check verifies netconf connectivity and displays the software version of the device.
junos_route_table_check-2.yml - This YAML file can be used to verify the routing table using Ansible.
ansible.cfg - Ansible has a few parameters that are most easily set in each directory to avoid path conflicts.
deploy-bgp.yml - This file is the template that Ansible uses to deploy BGP as the underlay routing protocol.
bgp-remove.yml - This file is the template that Ansible uses to remove BGP as the underlay routing protocol.
roles - This directory is where Juniper.junos lives and provides the Ansible integration into Junos
extinct-bgp.set - This is command line automation. It removes BGP on all devices.
policy.set - This is command line automation. It applies the policy to allow BGP to be deployed on Junos.
nbrconfigs - This is command line automation. This directory houses the configuration files for each device.

You can learn more about the Juniper configuration at:
https://www.juniper.net/us/en/training/jnbooks/day-one/fundamentals-series/routing-internet-protocol/
