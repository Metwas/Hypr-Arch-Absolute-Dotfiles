#!/bin/bash

curl -L -O https://github.com/Metwas/arch-hypr-dotfiles/archive/refs/heads/main.zip
sudo unzip ./main.zip
sudo mv -f ./arch-hypr-dotfiles-main/* ~/
sudo mv -f ./arch-hypr-dotfiles-main/.* ~/

sudo rm -rf ./arch-hypr-dotfiles-main
sudo rm ./main.zip

# autostart hyprland
sudo cat <<EOF | sudo tee ~/.zprofile
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  exec Hyprland
fi
EOF
