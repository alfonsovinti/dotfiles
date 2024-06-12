#!/usr/bin/env bash

#       __  ___      ___
#      /""\|"  \    /"  |
#     /    \\   \  //  /    Alfonso Vinti (alfonsovinti)
#    /' /\  \\\  \/. ./     https://www.alfonsovinti.it
#   //  __'  \\.    //      https://github.com/alfonsovinti
#  /   /  \\  \\\   /
# (___/    \___)\__/
#
# add-de.sh

# xorg display server installation
sudo apt install -y xorg xserver-xorg xbacklight xbindkeys xvkbd xinput

# Add build-essential
sudo apt install -y build-essential

# Create folders in user directory
xdg-user-dirs-update

# Add window manager
sudo apt install -y openbox

# Add display manager
sudo apt install -y lightdm
sudo systemctl enable lightdm

# Network files tools and system events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking
sudo apt install -y lxpolkit network-manager network-manager-gnome 

# File explorer
sudo apt install -y pcmanfm

# Terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# Sound
sudo apt install -y pipewire pavucontrol pamixer

# Add others
sudo apt install -y picom dunst libnotify-bin libnotify-dev feh rofi unzip

# ranger
# cheese
# conky conky-manager (to make)
# galculator
# geany
# gimp
# grub-customizer
# htop keepassx
# libreoffice
# light-locker
# lxappearance
# mintstick
# moc
# mousepad
# neofetch
# nnn
# obconf
# powertop
# redshift
# sakura
# sxiv
# thefuck
# thermald
# thunderbird
# tint2
# tlp
# touchpad-indicator
# zenity
# zim



# XFCE
# provide to istall following packages
# xfce4-session
# xfce4-settings
# xfce4-power-manager
# thunar
#sudo apt-get install --no-install-recommends xfce4-session xfce4-power-manager librsvg2-common
#sudo apt-get install --install-recommends xfce4-settings upower systemd-sysv light-locker thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin

#
#sudo apt-get install --no-install-recommends dunst
