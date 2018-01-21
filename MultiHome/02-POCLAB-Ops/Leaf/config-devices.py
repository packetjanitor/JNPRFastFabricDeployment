# Copyright 2017, Juniper Networks Pvt Ltd.
# All rights reserved.
# Inspired by Day One: Junos PyEZ Cookbook
# Pushes POC Standard Config to spine
# python3 version: Python 3.5.2
# command example: python3 config-devices.py
#!/usr/bin/env python3
from jnpr.junos import Device
from jnpr.junos.utils.config import Config
import sys
import getpass

if sys.stdin.isatty():
    print("Enter credentials")
    jnprusername = input("Username: ")
    jnprpassword = getpass.getpass("Password: ")
else:
    jnprusername = sys.stdin.readline().rstrip()
    jnprpassword = sys.stdin.readline().rstrip()

USER = jnprusername
PW = jnprpassword
CONFIG_FILE = 'gen-config.txt'
CONFIG_DATA = {
    'dns_server': '172.29.131.60',
    'ntp_server': '66.129.255.62',
}

def config_devices(devices='Testy-Python.txt'):
	with open(devices, 'r') as f:
		qfxdevices = f.readlines()
		qfxdevices = [x.strip() for x in qfxdevices]

		for qfxdevices in qfxdevices:
			dev = Device(host=qfxdevices, user=USER, password=PW).open()
			with Config(dev) as cu:
				cu.load(template_path=CONFIG_FILE, template_vars=CONFIG_DATA, format='set', merge=True)
				cu.commit(timeout=30)
				print("Committing the configuration on device: {}".format(qfxdevices))
			dev.close()

if __name__ == "__main__":
	config_devices()
