 #!/bin/bash

HOSTNAME=zen

print "\n\e[0;33mSystem setup\e[0m"

# ---

echo 'Set hostname...'

hostnamectl set-hostname "$HOSTNAME"

# ---

echo "###############################################"
echo '# Installing required packages for Openbox.'
echo "###############################################"

sudo dnf install -y \
            openbox \
            obconf \
            xbacklight \
            nitrogen \
            xorg-x11-drv-libinput \
            tint2 \
            volumeicon \
            xorg-x11-server-Xorg \
            network-manager-applet \
            NetworkManager-wifi \
            lightdm-gtk

echo "###############################################"
echo '# Packages installed.'
echo "###############################################"

# ---

echo "###############################################"
echo '# Enabling lightdm display manager & install slick-greeter...'
echo "###############################################"

systemctl enable lightdm; # Enable login using graphical interface
systemctl set-default graphical.target; # Boot to graphical interface as default
sudo dnf install -y slick-greeter

# ---

echo "###############################################"
echo '# Enabling Free and Non-free RPM Fusion Repositories...'
echo '# From https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/'
echo "###############################################"

sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update

# ---

echo "###############################################"
echo '# Installing DNF packages.  This may take some time ...'
echo "###############################################"

sudo dnf install -y \
    xed \
    geany \
    thunar \
    kitty \
    chromium \
    ffmpeg \
    htop \
    neofetch \
    viewnior \
    nano \
    flameshot \
    wget \
    tumbler \
    lxappearance \
    xarchiver \
    picom \
    inkscape \
    rofi \
    sxhkd \
    task \
    light-locker \
    dh-autoreconf \
    gcc-c++ \
    gtk3 gtk3-devel \
    papirus-icon-theme.noarch \
    google-noto-cjk-fonts-common.noarch \
    gcolor2 


echo "###############################################"
echo '# DNF packages installed...'
echo "###############################################"

# ---

echo "############################################"
echo "############################################"
echo "That's it...FINISHED..."
echo "To get to login screen type in: 'reboot'"
echo "############################################"
echo "############################################"
