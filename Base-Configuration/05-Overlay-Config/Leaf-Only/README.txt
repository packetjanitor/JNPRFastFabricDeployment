To deploy the overlay: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml

To remove the overlay: 
junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$ ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/overlay-remove.yml

Files and directories:
all.inv - This is the inventory file for the devices. I use a full inventory file to make it simple rather than making small groups and then calling each of them.       
configsoverlay - This is command line automation. This directory houses the configuration files for each device
junos_health_check-dual.yml - This health check verifies netconf connectivity and displays the software version of the device.
removeoverlay - This is command line automation. This directory houses the files that remove the configuration for each device
ansible.cfg - Ansible has a few parameters that are most easily set in each directory to avoid path conflicts.
deploy-overlay.yml - This file is the template that Ansible uses to deploy the overlay.
overlay-remove.yml - This file is the template that Ansible uses to deploy the overlay.
roles - This directory is where Juniper.junos lives and provides the Ansible integration into Junos

You can learn more about the Juniper configuration at:
https://www.juniper.net/documentation/en_US/junos/topics/example/evpn-vxlan-qfx5110-l3-vxlan-gateway-collapsed.html 
