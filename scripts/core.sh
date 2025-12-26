#!/bin/bash

# Update
sudo pacman -Sc --noconfirm
sudo pacman-key --populate archlinux
sudo pacman -Sy --noconfirm archlinux-keyring
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm iwd

# Hyprland base
sudo pacman -S --noconfirm hyprland
sudo pacman -S --noconfirm rofi-wayland
sudo pacman -S --noconfirm hyprpaper
sudo pacman -S --noconfirm hyprlock
sudo pacman -S --noconfirm xdg-desktop-portal-hyprland
sudo pacman -S --noconfirm xorg-xwayland
