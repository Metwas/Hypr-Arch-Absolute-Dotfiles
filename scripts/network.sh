#!/bin/bash

# Essential networking
sudo pacman -S --needed --noconfirm iwd

sudo mkdir /etc/iwd
sudo mkdir /etc/systemd/resolved.conf.d

sudo cat <<EOF | sudo tee /etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
EOF

sudo cat <<EOF | sudo tee /etc/systemd/resolved.conf.d/dns_servers.conf
[Resolve]
DNS=8.8.8.8 1.1.1.1 1.0.0.1
Domains=~.
EOF

sudo systemctl enable iwd.service
sudo systemctl enable systemd-resolved.service
