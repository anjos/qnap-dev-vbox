#!/bin/bash
apt-get update
apt-get -y install curl facter git vim-nox nano gedit gedit-plugins

# setup to auto-login with the single user we have
apt-get -y install nodm
apt-get -y autoremove lightdm-gtk-greeter
echo "/usr/sbin/nodm" > /etc/X11/default-display-manager
echo -e 'NODM_ENABLED=true\nNODM_USER=qnap\n' >> /etc/default/nodm

# makes grub initialize immediately
echo -e 'GRUB_FORCE_HIDDEN_MENU=true\nGRUB_HIDDEN_TIMEOUT_QUIET=true\nGRUB_TIMEOUT=0\n' >> /etc/default/grub
update-grub
