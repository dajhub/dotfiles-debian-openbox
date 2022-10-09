echo "###############################################"
echo '# Install yay'
echo "###############################################"

pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -Syu --noconfirm

# ---

echo "###############################################"
echo '# yay installed'
echo "###############################################"

echo "###############################################"
echo '# Install basic packages'
echo "###############################################"

yay -Syy --noconfirm \
            vlc \
            zip \
            unzip \
            gmtp \
            mtpfs \
            evince \
            wget \
            xdg-utils \
            xdg-user-dirs \
            network-manager-applet \
            tlp

# Enable services
systemctl enable --now cronie
systemctl enable --now tlp

echo "###############################################"
echo '# Basic packages installed'
echo "###############################################"

#---

echo "###############################################"
echo '# Installing required packages for Openbox.'
echo "###############################################"

# Install Openbox and dependences
yay -Sy --noconfirm \
            openbox \
            obconf \
            tint2 \
            volumeicon \
            xorg \
            xorg-server \
            xorg-xinit \
            lxappearance \
            nitrogen \
            pavucontrol \
            picom \
            rofi \
            sxhkd \
            xfce4-screenshooter \
            xfce4-clipman-plugin \
            xfce4-power-manager \
            arandr \
            exo \
            gsimplecal \
            xcape \
            gparted \
            file-roller \
            xautomation \
            networkmanager \
            python-pyxdg

systemctl mask NetworkManager-wait-online.service

# COPY obamenu
cp -v "$base_dir/obamenu" /usr/bin
chmod +x /usr/bin/obamenu

# Create config folder if no exists
d="$d/.config/"
[ ! -d "$d" ] && mkdir -v "$d" && chown -R $(stat "$d" -c %u:%g) "$d"

echo "###############################################"
echo '# Packages for Openbox installed.'
echo "###############################################"

#--- 

echo "###############################################"
echo '# Install and enable lightdm display manager.'
echo "###############################################"

yay -S --noconfirm lightdm lightdm-gtk-greeter

systemctl start lightdm.service && systemctl enable lightdm.service

echo "###############################################"
echo '# Lightdm display manager installed.'
echo "###############################################"

#---

echo "###############################################"
echo '# Install thunar.'
echo "###############################################"

# Install thunar
yay -Sy --noconfirm thunar thunar-archive-plugin thunar-media-tags-plugin catfish gvfs gvfs-mtp gvfs-nfs gvfs-smb

echo "###############################################"
echo '# Installed thunar.'
echo "###############################################"

#---

echo "###############################################"
echo '# Install VSCodium.'
echo "###############################################"
 
(
    sudo -u nobody git clone https://aur.archlinux.org/vscodium-bin /tmp/vscodium-bin
    cd /tmp/vscodium-bin
    sudo -u nobody makepkg -sirc --noconfirm
)

# Cleanup
rm -rf /tmp/vscodium-bin

echo "###############################################"
echo '# VSCodium installed.'
echo "###############################################"

#---

echo "###############################################"
echo '# Installing additional packages.'
echo "###############################################"

yay -Sy --noconfirm \
    xed \
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
    inkscape \
    task \
    gcolor2 

echo "###############################################"
echo '# FINISHED.'
echo "###############################################"