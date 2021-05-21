#!/usr/bin/env bash

#       __  ___      ___
#      /""\|"  \    /"  |
#     /    \\   \  //  /    Alfonso Vinti (alfonsovinti)
#    /' /\  \\\  \/. ./     https://www.alfonsovinti.it
#   //  __'  \\.    //      https://github.com/alfonsovinti
#  /   /  \\  \\\   /
# (___/    \___)\__/
#
# debia-de-install.sh

set -e

sudo apt-get update && sudo apt-get upgrade

#
sudo apt-get purge python3-pip && sudo apt-get install --install-recommends python3-pip

sudo apt-get purge compton
#sudo apt-get install xorg picom dunst feh ranger rofi
# sxhkd
# jgmenu

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
sudo apt-get install --no-install-recommends xfce4-session xfce4-power-manager librsvg2-common
sudo apt-get install --install-recommends xfce4-settings upower systemd-sysv light-locker thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin

#
sudo apt-get install --no-install-recommends dunst
