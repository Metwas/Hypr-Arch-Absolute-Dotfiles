#!/bin/bash

# YAY
git clone https://aur.archlinux.org/yay-bin.git
cd ./yay-bin
sudo makepkg -si

sudo cat <<EOF | sudo tee /etc/default/grub
GRUB_DEFAULT=0
GRUB_TIMEOUT=0
EOF

sudo mkdir /boot/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkdir /etc/systemd/getty@tty1.service.d

sudo cat <<EOF | sudo tee /etc/systemd/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin metwas %I $TERM
EOF

# Drivers
sudo pacman -S --needed --noconfirm mesa
sudo pacman -S --needed --noconfirm xf86-video-amdgpu
sudo pacman -S --needed --noconfirm vulkan-radeon
sudo pacman -S --needed --noconfirm libva-mesa-driver
sudo pacman -S --needed --noconfirm pipewire pipewire-pulse pipewire-alsa lib32-pipewire lib32-pipewire-pulse lib32-libpulse lib32-alsa-lib lib32-alsa-plugins

# Apps
yay -S --needed --noconfirm brave-bin
yay -S --needed --noconfirm zed
yay -S --needed --noconfirm cava
yay -S --needed --noconfirm yazi
yay -S --needed --noconfirm tty-clock

# ZED custom THEME
sudo mkdir ./.config/zed
sudo mkdir ./.config/zed/themes

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Restart
sudo systemctl daemon-reexec
