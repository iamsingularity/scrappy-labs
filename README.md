# Scrappy Labs

This playbook will install and configure my typical malware anlysis lab setup. This was never really meant to be shared and it may not even work on your setup or network depending on your lan config etc etc.

I run this on a fresh ubuntu 16.04 install, i doubt it will work on anything else without a fair amount of work.

Here is a (very) short doc:

This lab uses kvm as the hypervisor and installs virt-manager. There are two bridged interfaces created and configured for me to attach VMs to, br0 and br1.
br0 is treated as the "greenzone". I'ts iptables config allows all outgoing connections to the internet but not to local lan networks.
br1 is treated as the "redzone". It's iptables config allows all outgoing connections to the internet, but transparently routes them through tor, masking your IP address. It also doesn't allow outgoing connections to local lan networks.

## Setup:

- Generate ssh key with no password
- Add key to github (cloning over ssh for workstation so I can modify my dotfiles easily)
- Set correct config in `./bootstrap.sh`
- Run `sudo ./bootstrap.sh`, this will install ansible and run the playbook.

If you want to run the labs playbook (to set up an ubuntu 16.04 server instance):

- Copy the `./playbook/inventory.yml.example` file to `./playbook/inventory.yml` and set up your hosts with the correct config (as shown in the example).
- Run `ansible-playbook playbook/labs.yml -i playbook/inventory.yml --ask-sudo-pass`.


## TODO

Set up my "blackzone", routing all traffic to inetsim.

