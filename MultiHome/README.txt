The first topology is built from:
https://www.juniper.net/documentation/en_US/junos/topics/example/evpn-vxlan-qfx5110-l3-vxlan-gateway-collapsed.html
Figure 2 with 2 spines and 5 leafs and a multi-homed device.

Here is video around the use of the automation and how I built it. https://youtu.be/yuXpycsW48Q 

These scaling numbers are good enough for my testing. So, I put these two commands in the base configuration because they reboot the PFE when the commit occursas they are ASIC level programming commands.
~set forwarding-options vxlan-routing interface-num 8192~
~set forwarding-options vxlan-routing next-hop 16384~

I used the commands right on the bottom of that webpage. I used one of the spine devices to become an LACP attached environment for the multihomed topology.

To build our fabric using OSPF from the automation using the command line at the Base-Configuration directory level:

junivator@Automation:~/JNPRFastFabricDeployment/MultiHome$

Enter the following commands:
~ansible-playbook -i 02-PortSetup/all.inv 02-PortSetup/deploy-arch.yml~
~ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml~
~ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml~
~ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml~

To remove our fabric using OSPF from the automation using the command line at the Base-Configuration directory level:

junivator@Automation:~/JNPRFastFabricDeployment/MultiHome$

Enter the following commands:
~ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/overlay-remove.yml~
~ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/ospf-remove.yml~
~ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/address-remove.yml~
~ansible-playbook -i 02-PortSetup/all.inv 02-PortSetup/arch-remove.yml~

You can choose a different routing protocol by substituting:
For ISIS
~ansible-playbook -i 04-Routing/ISIS/all.inv 04-Routing/ISIS/deploy-isis.yml~
For BGP
~ansible-playbook -i 04-Routing/BGP/all.inv 04-Routing/BGP/deploy-bgp.yml~

for the command
~ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml~

To remove the different Routing protcols:
For ISIS
~ansible-playbook -i 04-Routing/ISIS/all.inv 04-Routing/ISIS/isis-remove.yml~
For BGP
~ansible-playbook -i 04-Routing/BGP/all.inv 04-Routing/BGP/bgp-remove.yml~

After the overlay is up, you can add or remove routing protocols at any time to
assist in the evaluation of operational and functional requirements.

If in the course of your learning, you do something to the network or make a few changes and get the network into a bad state. You can go to the Starting-Point directory and follow the directions there to help rebuild the network by getting to that known starting state.

There is a PFE reset required on the two leaf nodes that LACP was enabled on when going to another topology. I just reboot the boxes for speed. However, there is a JTAC article on how to reset them.
