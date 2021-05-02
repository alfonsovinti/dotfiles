#!/usr/bin/env bash

#       __  ___      ___
#      /""\|"  \    /"  |
#     /    \\   \  //  /    Alfonso Vinti (alfonsovinti)
#    /' /\  \\\  \/. ./     https://www.alfonsovinti.it
#   //  __'  \\.    //      https://github.com/alfonsovinti
#  /   /  \\  \\\   /
# (___/    \___)\__/
#
# check-installed-packages.sh

# required packages
packages=(
    # Termina & shells
    "xterm"
    "alacritty"
    "zsh"
    #zsh-completions
    "fish"
    "tmux"
    #wpa_supplicant
    #network-manager-applet
    #networkmanager
    #kvantum-qt5
    #openssh
    # DE
    #"xorg"
    "lxsession-gtk3"
    "picom"          # composer
    "arandr"
    "pcmanfm-gtk3"
    #"xarchiver"
    #"gvfs" # (optional) for trash support, mounting with udisks and remote filesystems
    "lxappearance-gtk3"
    #"lxinput-gtk3"
    #"lxrandr-gtk3"
    # Utility
    "reflector"      # repo manager
    "dialog"
    "git"
    "htop"
    "bat"            # cat
    "exa"
    "i3lock"
    "feh"            # wall manager
    "xdg-user-dirs"
    "python"
    "python-pip"
    "xsel"           # getting and setting the contents of the X selection
    # Editor
    "emacs"
    "python-pynvim"  # requirede by neovim
    # File manager
    "ranger"
    "nnn"
    "dmenu"
    "rofi"
    "sl"
    "firefox"
    "nodejs"
    "npm"
)

aurp=(
    "neovim-git"
    "ueberzug"
)

_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# The packages that are not installed will be added to this array.
toInstall=();

for package in "${packages[@]}"; do
    # If the package IS installed:
    if [[ $(_isInstalled "${package}") == 0 ]]; then
        echo "[${package}] is already installed.";
    fi;

    # If the package is NOT installed:
    if [[ $(_isInstalled "${package}") == 1 ]]; then
        toInstall+=("${package}");
        #echo "[${package}] is not installed.";
    fi;
done

# If no packages were added to the "${toInstall[@]}" array,
#     don't do anything and stop this function.
if [[ "${toInstall[@]}" == "" ]] ; then
    echo "All packages are already installed.";
else
    printf -v toInstallList "%s " "${toInstall[@]}";
    # Otherwise, install all the packages that have been added to the "${toInstall[@]}" array.
    printf "\nPackages not installed:\n%s\n\n" "${toInstallList}";
    sudo pacman -S "${toInstall[@]}";
fi;
