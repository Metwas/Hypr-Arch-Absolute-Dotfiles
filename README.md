# Update
pacman -Syu

# Hyprland base
pacman -Sy hyprland waybar rofi-wayland hyprpaper 

# Tools
pacman -Sy kitty fastfetch base-devel ninja gcc

# Drivers
pacman -Sy mesa xf86-video-amdgpu vulkan-radeon libva-mesa-driver

# Apps
yay -Sy thorium-browser-bin vscodium

