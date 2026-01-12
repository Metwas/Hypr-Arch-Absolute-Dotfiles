#!/bin/bash

# Update
sudo pacman -Sc --noconfirm
sudo pacman-key --populate archlinux
sudo pacman -Sy --noconfirm archlinux-keyring
sudo pacman -Syu --noconfirm
sudo pacman -Sy --needed --noconfirm iwd
sudo pacman -S --needed --noconfirm wine winetricks sdl2-compat gst-plugins-base-libs gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg samba gnutls lib32-alsa-oss
sudo pacman -S --needed --noconfirm pipewire pipewire-pulse pipewire-alsa lib32-pipewire lib32-pipewire-pulse lib32-libpulse lib32-alsa-lib lib32-alsa-plugins
sudo pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon mesa lib32-mesa
sudo pacman -S --needed --noconfirm --needed gcc-libs lib32-gcc-libs glibc lib32-glibc
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
  webkit2gtk-4.1 \
  base-devel \
  curl \
  wget \
  file \
  openssl \
  appmenu-gtk-module \
  libappindicator-gtk3 \
  librsvg \
  xdotool

# Hyprland base
sudo pacman -S --needed --noconfirm hyprland
sudo pacman -S --needed --noconfirm rofi-wayland
sudo pacman -S --needed --noconfirm hyprpaper
sudo pacman -S --needed --noconfirm hyprlock
sudo pacman -S --needed --noconfirm xdg-desktop-portal-hyprland
sudo pacman -S --needed --noconfirm xorg-xwayland

# Tools
sudo pacman -S --needed --noconfirm nmap
