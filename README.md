# Update
pacman -Syu --noconfirm

# Hyprland base
sudo pacman -S --noconfirm hyprland    
pacman -S --noconfirm rofi-wayland 
pacman -S --noconfirm hyprpaper 
pacman -S --noconfirm hyprlock 
pacman -S --noconfirm xdg-desktop-portal-hyprland 

# waybar ??
# pacman -S waybar

# Tools
sudo pacman -S --noconfirm kitty        
sudo pacman -S --noconfirm fastfetch
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm ninja
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

yay -S --noconfirm cava
yay -S --noconfirm yazi

# Drivers
pacman -S --noconfirm mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver

# Apps
yay -S --noconfirm thorium-browser-bin vscodium esp-idf

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
# exec-once = conky -c /home/metwas/.config/conky

# Conky 
pacman -S --noconfirm conky

# Conky configuration
conky.config = {
    background = true,
    update_interval = 5,
    own_window = true,
    own_window_type = 'dock',
    own_window_argb_visual = true,
    own_window_argb_value = 150,
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    double_buffer = true,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = false,
    use_xft = true,
    alignment = 'top_middle',
    uppercase = true,	
    gap_x = 10,
    gap_y = 100,
    minimum_width = 250, minimum_height = 5
}

conky.text = [[
${font Anurati:size=75}${color D6D5D4}${time %A}
]]



