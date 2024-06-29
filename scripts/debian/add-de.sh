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
ln -sf $CONFIG_DIR/debian/misc/user-dirs.dirs $HOME/.config/user-dirs.dirs
mkdir -p $HOME/downloads
mkdir -p $HOME/documents
mkdir -p $HOME/music
mkdir -p $HOME/images
mkdir -p $HOME/videos
mkdir -p $HOME/templates
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

# Awesome packages
sudo apt install -y awesome awesome-extra awesome-doc

# Sound
sudo apt install -y pipewire-audio 

# File archiver
sudo apt install -y engrampa p7zip-full p7zip-rar rar unrar unace bzip2

# Add others
sudo apt install -y \
    picom dunst libnotify-bin libnotify-dev feh nitrogen rofi scrot \
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
