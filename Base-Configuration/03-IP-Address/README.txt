To deploy the addresses and interfaces: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml
To remove the addresses and interfaces: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/address-remove.yml

Files and directories:
all.inv - This is the inventory file for the devices. 
junos_health_check-dual.yml - This health check verifies netconf connectivity and displays the software version of the device.
ansible.cfg - Ansible has a few parameters that are most easily set in each directory to avoid path conflicts.
deploy-address.yml - This file is the template that Ansible uses to deploy the interfaces and ip addresses.
address-remove.yml - This file is the template that Ansible uses to remove the interfaces and ip addresses.
roles - This directory is where Juniper.junos lives and provides the Ansible integration into Junos
ipconfigs - This is command line automation. This directory houses the configuration files for each device.
removeips - This is command line automation. This directory houses the files that remove the configuration for each device.

You can learn more about the Juniper configuration at:
https://www.juniper.net/documentation/en_US/junos/topics/example/evpn-vxlan-qfx5110-l3-vxlan-gateway-collapsed.html
https://www.juniper.net/us/en/training/jnbooks/day-one/fundamentals-series/routing-internet-protocol/
