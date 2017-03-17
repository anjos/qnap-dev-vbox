#!/bin/bash

apt-get -y install sudo

# Set up password-less sudo for user qnap
echo 'qnap ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/qnap
chmod 440 /etc/sudoers.d/qnap

# no tty
echo "Defaults !requiretty" >> /etc/sudoers
