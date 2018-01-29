It's happened to everyone... 
You make a few to many changes and the network isn't in a place for you to experiment/learn any more.

Here's some help to get you back on track.

You can redeploy everything with the ~./Build-Fabric.sh~ command from the Base-Configuration prompt.

If that fails to the get the network back to the known-good/ base-configuration state, I have created this nuclear option to help you start over.
~~/JNPRFastFabricDeployment/Base-Configuration/uh-oh$ ansible-playbook -i all.inv uh-oh.yml~

(Ignore the output as some of your files on the machine were likely corrupted. I usually run it twice for good measure.)

This option deletes the configuration that we've added in every device but keeps our device access together. The "groups" feature is untouched so we can just put everything back with the ~./Build-Fabric.sh~ command from the Base-Configuration prompt. 

If the spine has already been de-provisioned, you'll get the following message "fatal: [QFX5110-32Q-169]: FAILED! => {"changed": false, "msg": "Unable to load config: ConfigLoadError(severity: warning, bad_element: None, message: warning: statement not found\nwarning: statement not found\nwarning: statement not found\nwarning: statement not found)"}"

You can use following command to get to the junos-leaf devices by skipping around in the inventory file. 
~ansible-playbook -i all.inv --limit "junos-leaf" uh-oh.yml~
