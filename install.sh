#!/bin/bash
# Essential networking
sudo pacman -S --noconfirm iwd

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

# waybar ??
# pacman -S waybar

# Tools
sudo pacman -S --noconfirm kitty
sudo pacman -S --noconfirm fastfetch
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm ninja
sudo pacman -S --noconfirm clang
sudo pacman -S --noconfirm gcc
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm make
sudo pacman -S --noconfirm ncurses
sudo pacman -S --noconfirm flex
sudo pacman -S --noconfirm bison
sudo pacman -S --noconfirm gperf
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm fzf
sudo pacman -S --noconfirm wireshark-cli
sudo pacman -S --noconfirm zip
sudo pacman -S --noconfirm unzip
sudo pacman -S --noconfirm rar
sudo pacman -S --noconfirm conky
sudo pacman -S --noconfirm cmatrix
sudo pacman -S --noconfirm btop
sudo pacman -S --noconfirm go
sudo pacman -S --noconfirm grub
sudo pacman -S --noconfirm thunar
# sudo pacman -S --noconfirm brightnessctl

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
sudo pacman -S --noconfirm mesa
sudo pacman -S --noconfirm xf86-video-amdgpu
sudo pacman -S --noconfirm vulkan-radeon
sudo pacman -S --noconfirm libva-mesa-driver

# Apps
yay -S --noconfirm thorium-browser-bin
yay -S --noconfirm zed
yay -S --noconfirm esp-idf
yay -S --noconfirm cava
yay -S --noconfirm yazi
yay -S --noconfirm hollywood
yay -S --noconfirm tty-clock

# ZED custom THEME
git clone https://github.com/Metwas/nightfox.zed.git

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NVM (zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -S ttf-meslo-nerd-font-powerlevel10k
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Must enter this in the .zshrc file
# plugins=(zsh-nvm zsh-autosuggestions)

# Hyprland dotfiles
curl -L -O https://github.com/Metwas/arch-hypr-dotfiles/archive/refs/heads/main.zip
sudo unzip ./main.zip
sudo mv ./arch-hypr-dotfiles-main/* ~/
sudo mv ./arch-hypr-dotfiles-main/.* ~/

sudo rm -rf ./temp
sudo rm ./main.zip

# autostart hyprland
sudo cat <<EOF | sudo tee ~/.zprofile
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec Hyprland
fi
EOF

# Restart
sudo systemctl daemon-reexec
