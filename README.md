# Update
pacman -Syu --noconfirm

# Hyprland base
pacman -S --noconfirm hyprland waybar rofi-wayland hyprpaper 

# Tools
pacman -S --noconfirm kitty fastfetch base-devel ninja gcc

# Drivers
pacman -S --noconfirm mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver

# Apps
yay -S --noconfirm thorium-browser-bin vscodium

