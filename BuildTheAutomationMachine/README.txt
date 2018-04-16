Standard Ubuntu 16.04.03 Install. Install OpenSSH server at the end. Everything else can be default. 

Watch me build the machine right here -->  https://youtu.be/lMAcZuouR0s 

Hint: DO NOT do this on the VPN.

Update the virtual machine. 
~sudo su~
~apt-get update && apt-get upgrade -y~

We are using ansible. Ansible uses python. We need to install python. 

~apt-get install python-pip python-dev libxml2-dev libxslt-dev libssl-dev libffi-dev -y~

At the "user@host$" prompt, update both PIPs for python.
~sudo -H pip install --upgrade pip~

Here are the Juniper libraries we need to make ansible work. 

~sudo -H pip install junos-eznc jxmlease~

We want the 2.4 version of Ansible and 1.4.3 version of our module. 

~sudo -s~
~pip install ansible==2.4.2.0~
~ansible-galaxy install Juniper.junos,1.4.3~

You are in superuser mode, which is cool if that is how you want to run everything. To fix this, we need to change the ownership of the libraries from the root prompt.

~chown juniper12:juniper12 .ansible~
~chown juniper12:juniper12 .ansible/*~
~chown juniper12:juniper12 .ansible_galaxy~

Update the /etc/hosts file with all of your networking devices to match your network. I leave the IPv6 information at the bottom.

~sudo vi /etc/hosts~ 
user@host$ more /etc/hosts
127.0.0.1	localhost
127.0.1.1	AutoMach
192.2.0.9	QFX5110-32Q-9
192.2.0.10	QFX5110-32Q-10


# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

Clone all of these automation files into a directory. 
~git clone https://github.com/packetjanitor/JNPRFastFabricDeployment.git~

I will cover the ansible configuration tools in their repspective directories a little later. However, this will get you the password deployment tool that's in this directory. You'll thank me later if you have alot of devices.

Enter the command from the "user@host$", if you do it as root (sudo) the key will be for root and not the user:
~ssh-keygen~ 
Accept the defaults.

Enter the command:
~cat /home/juniper12/.ssh/id_rsa.pub~

It will print something like:
ssh-rsa ThisIsTheKeyThatSSHKeyGenJustMade juniper12@juniper12

SSH to all of your hosts for the last time and input the key. 

~set system login user juniper12 uid 2012 class super-user authentication ssh-rsa "ssh-rsa ThisIsTheKeyYouJustMadeBecauseYouAreAwesome juniper12@juniper12"~ 

Login to each networking device and accept the key from the networking device into your known_hosts file. You’ll note there’s no password entry now that the key is complete. 
