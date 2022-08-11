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

sudo dnf install -qy \
            openbox \
            xbacklight \
            nitrogen \
            xorg-x11-drv-libinput \
            tint2 \
            volumeicon \
            xorg-x11-server-Xorg \
            network-manager-applet \
            lightdm-gtk

echo "###############################################"
echo '# Packages installed.'
echo "###############################################"

# ---
echo "###############################################"
echo '# Enabling lightdm display manager...'
echo "###############################################"

systemctl enable lightdm; # Enable login using graphical interface
systemctl set-default graphical.target; # Boot to graphical interface as default

# ---

echo "###############################################"
echo '# Installing DNF packages.  This may take some time ...'
echo "###############################################"

sudo dnf install -qy \
    xed \
    geany \
    thunar \
    kitty \
    chromium \
    htop \
    neofetch \
    viewnior \
    nano \
    flameshot \
    wget \
    tumbler \
    lxappearance \
    picom \
    rofi \
    task \
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