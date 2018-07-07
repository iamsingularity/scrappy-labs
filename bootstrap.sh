#!/bin/bash

# Config
ANALYST_USERNAME="scrappy"
UPSTREAM_IFACE_NAME="enp4s0"

if ! which ansible > /dev/null; then
	echo "Installing ansible"
	sudo apt-get update
	sudo apt-get install software-properties-common -y
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible -y
fi

echo "Provisioning machine"
sudo ansible-playbook playbook/workstation.yml \
	-c local \
	--extra-vars "local_user=$ANALYST_USERNAME upstream_iface_name=$UPSTREAM_IFACE_NAME"

exit $?
