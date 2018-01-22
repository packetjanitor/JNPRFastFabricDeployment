Standard Ubuntu 16.04.03 Install. Install OpenSSH server at the end. Everything else can be default. 

Watch me build the machine right here -->  https://youtu.be/lMAcZuouR0s 

Hint: DO NOT do this on the VPN.

Update the virtual machine. 
~sudo su~
~apt-get update && apt-get upgrade -y~

We are using ansible. Ansible uses python. We need to install python. 

~apt-get install python-pip python-dev libxml2-dev libxslt-dev libssl-dev libffi-dev -y~
~apt-get install libpython3-dev libpython3.5-dev python3-dev python3-pip python3-setuptools python3-wheel python3.5-dev -y~

At the "user@host$" prompt, update both PIPs for python.
~sudo -H pip install --upgrade pip~
~sudo -H pip3 install --upgrade pip~

Here are the Juniper libraries we need to make ansible work. Note we use pip2 to make sure they don't default into python3 and pip3 so that python3 is also updated. Some of these won't install and will say they are already "satisfied". However, the libraries and team that maintain them make necessary fixes closest to the error. So, it's entirely possible they could change something.
~sudo -H pip2 install junos-eznc~
~sudo -H pip2 install jxmlease~
~sudo -H pip3 install junos-eznc~
~sudo -H pip3 install jxmlease~

We want the 2.4 version of Ansible. Mostly because if you have to fix it there is a lot more logging and it has more granularity in error messages. I also don't want every development release for every project so we are a little specific right here.

~sudo vi /etc/apt/sources.list~
~deb http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main~

Enter the following 
~sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367~

~sudo apt-get update~

~sudo apt-get install ansible -y~

Now we need to install our ansible module.
Good news Ansible’s updates servers are on the most current module. Bad news, all of the automation I wrote is on the old version. I am working to upgrade to the new ansible verbiage and model.

~ansible-galaxy install Juniper.junos,1.4.3~   <— Case sensitive

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
~cat /home/junivator/.ssh/id_rsa.pub~
ssh-rsa ThisIsTheKeyThatSSHKeyGenJustMade junivator@automation

SSH to all of your hosts for the last time and input the key or use the python script in this directory. 

~set system login user jnpradmin uid 2005 class super-user authentication ssh-rsa "ssh-rsa ThisIsTheKeyYouJustMadeBecauseYouAreAwesome jnpradmin@AutoMach"~ 

Login to each networking device and accept the key from the networking device into your known_hosts file. You’ll note there’s no password entry now that the key is complete. 
