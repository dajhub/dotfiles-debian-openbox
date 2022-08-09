 #!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential

# Microcode for Intel/AMD 
# sudo apt install -y amd-microcode
sudo apt install -y intel-microcode 

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# File Manager (eg. pcmanfm,krusader,thunar)
sudo apt install -y pcmanfm

# Terminal (eg. terminator,kitty,xfce4-terminal)
sudo apt install -y terminator

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# Network Manager
sudo apt install -y network-manager network-manager-gnome 

# Installation for Appearance management
sudo apt install -y lxappearance 

# Browser Installation (eg. chromium)
sudo apt install -y chromium

### Librewolf -- debian unstable version [source: https://librewolf.net/installation/debian/]
echo 'deb http://download.opensuse.org/repositories/home:/bgstack15:/aftermozilla/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/home:bgstack15:aftermozilla.list
curl -fsSL https://download.opensuse.org/repositories/home:bgstack15:aftermozilla/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_bgstack15_aftermozilla.gpg > /dev/null
sudo apt update
sudo apt install librewolf -y

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
sudo apt install -y nitrogen
 
# Fonts and icons for now
sudo apt install -y fonts-firacode fonts-liberation2 fonts-ubuntu papirus-icon-theme fonts-cascadia-code

# Openbox packages
sudo apt install -y openbox dunst dbus-x11 hsetroot i3lock libnotify-bin lximage-qt menu picom  qt5-style-plugins rofi scrot tint2 xfce4-power-manager 

# Lightdm login manager
sudo apt install -y lightdm
systemctl enable lightdm; # Enable login using graphical interface
systemctl set-default graphical.target; # Boot to graphical interface as default

# Configuration Setup
mkdir -p ~/.config/openbox
cp -a /etc/xdg/openbox/ ~/.config/

########################################################
# End of script for default config
########################################################


sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
