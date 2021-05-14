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
