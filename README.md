# Update
pacman -Syu --noconfirm

# Hyprland base
pacman -S --noconfirm hyprland rofi-wayland hyprpaper hyprlock xdg-desktop-portal-hyprland

# waybar ??
# pacman -S waybar

# Tools
pacman -S --noconfirm kitty fastfetch base-devel ninja gcc zsh fzf

# Drivers
pacman -S --noconfirm mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver

# Apps
yay -S --noconfirm thorium-browser-bin vscodium

# NVM (zsh)
yay -S ttf-meslo-nerd-font-powerlevel10k
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Must enter this in the .zshrc file 
# plugins=(zsh-nvm zsh-autosuggestions)

# ZSH THEME
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# change ZSH_THEME=powerlevel10k/powerlevel10k

# Autostart Hyprland stuff

# Add the following to the ~/.bash_profile OR ~/.zprofile
# if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
#  exec Hyprland
# fi

# Add the following hyprland tools to the ~/.config/hypr/hyprland.conf
# exec-once = waybar &
# exec-once = hyprpaper &

# Conky 
pacman -S --noconfirm conky

# Configure conky to support wayland
mkdir -p ~/.config/conky
cat > ~/.config/conky/conky.conf <<EOF
conky.config = {
    background = true,
    update_interval = 1,
    own_window = true,
    own_window_type = 'dock',
    own_window_transparent = true,
    double_buffer = true,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,
    use_xft = true,
    alignment = 'top_right',
    gap_x = 10,
    gap_y = 10,
    minimum_width = 250, minimum_height = 5
}

conky.text = [[
\${time %H:%M:%S}
\${cpu cpu0}% CPU
\${mem} RAM
\${fs_free /} free disk
]]
EOF

echo "Conky configuration written to ~/.config/conky/conky.conf"



