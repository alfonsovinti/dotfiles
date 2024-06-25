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
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput xscreensaver desktop-base

# Microcode for Intel/AMD 
#sudo apt install -y amd64-microcode
#sudo apt install -y intel-microcode 

# Create folders in user directory
xdg-user-dirs-update

# Add display manager
sudo apt install -y --no-install-recommends sddm qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6

# Network files tools and system events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends mate-power-manager
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking
sudo apt install -y lxpolkit network-manager network-manager-gnome 

# File explorer
sudo apt install -y pcmanfm tumbler

# Openbox packages
sudo apt install -y openbox menu arandr lxappearance lxappearance-obconf lxinput lxterminal

# TODO: i3 packages
#apt install -y --no-install-recommends i3
#apt install -y  i3lock i3lock-fancy

# Sound
sudo apt install -y pipewire-audio 

# File archiver
sudo apt install -y engrampa p7zip-full p7zip-rar rar unrar unace bzip2

# Add others
sudo apt install -y \
    picom dunst libnotify-bin libnotify-dev feh nitrogen rofi polybar scrot \
    conky parcellite numlockx galculator galternatives papirus-icon-theme \
    ttf-mscorefonts-installer \
    light synaptic

# Add app
sudo apt install -y firefox-esr gimp inkscape
# conky-manager 
# redshift
# thefuck
# thermald
# thunderbird
# tlp
# zenity
