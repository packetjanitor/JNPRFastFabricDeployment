The first topology is built from: 
https://www.juniper.net/documentation/en_US/junos/topics/example/evpn-vxlan-qfx5110-l3-vxlan-gateway-collapsed.html
Figure 1 with 3 spines and 5 leafs.

Here is video around the use of the automation and how I build it. https://youtu.be/yuXpycsW48Q

I built the other topologies but they are in other sections that I will add as I get more time. 

I used the commands right on the bottom of that webpage with the exception of the multi-home/LACP commands. I was super focused on load-balancing and failover for this part.

So the odd numbers (3 spines/5 leafs) reflect my choice not to deploy multi-homing in the first round. I will use one of the spine devices to become an LACP attached environment for the multihomed topology. 

To build our fabric using OSPF from the automation using the command line at the Base-Configuration directory level:

junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$

Enter the following commands:
~ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/deploy-addresses.yml~
~ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/deploy-ospf.yml~
~ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/deploy-overlay.yml~

To remove our fabric using OSPF from the automation using the command line at the Base-Configuration directory level:

junivator@Automation:~/JNPRFastFabricDeployment/Base-Configuration$

Enter the following commands:
~ansible-playbook -i 05-Overlay-Config/Leaf-Only/all.inv 05-Overlay-Config/Leaf-Only/overlay-remove.yml~
~ansible-playbook -i 04-Routing/OSPF/all.inv 04-Routing/OSPF/ospf-remove.yml~
~ansible-playbook -i 03-IP-Address/all.inv 03-IP-Address/address-remove.yml~

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

After the overlay is up, you can add or remove routing protocols at any time to assist in the evaluation of operational and functional requirements.

If in the course of your learning, you do something to the network or make a few changes and get the network into a bad state. You can go to the uh-oh directory and follow the directions there to help rebuild the network.


