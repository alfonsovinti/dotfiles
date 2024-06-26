#!/bin/bash

set -euo pipefail

# Variables setup
#BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly GIT_DIR=$(git rev-parse --show-toplevel)
readonly CONFIG_DIR="$GIT_DIR/config"
readonly ASSETS_DIR="$GIT_DIR/assets"
readonly RESOURCES_DIR="$GIT_DIR/resources"
readonly SCRIPTS_DIR="$GIT_DIR/scripts"
readonly TMP_DIR="$GIT_DIR/tmp"
readonly OFS="\n"

function dtfn_prompt () {
    local o="[y/n]"
    local d=""
    local yn=""
    if [ $# -ge 2 ] && [ -n "$2" ];
    then
        case "$2" in
        true) 
            o="[Y/n]" 
            d="y"
        ;;
        false) 
            o="[y/N]"
            d="n"
        ;;
        esac
    fi
    while true; do
        read -p "$1 $o: " yn
        case "$yn" in
            [Yy])  return 0 ;;  
            [Nn])  return 1 ;;
            "") 
                    case "$d" in
                        y) return 0 ;;
                        n) return 1 ;;
                        *) echo "invalid response" ;;
                    esac
                    ;;
            *)  echo "invalid response" ;;
        esac
    done
}

# Create temp dir
mkdir -p $TMP_DIR

# Update system
sudo apt update && sudo apt upgrade

# Install pkg
dtfn_prompt "Install required?" true && {
    sudo apt install podman curl wget htop iftop iotop neofetch exa bat tmux man-db manpages manpages-it bash-completion fonts-recommended build-essential unzip xsel luarocks
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
    if [ ! -d "$HOME/.nvm" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    fi
    . $SCRIPTS_DIR/debian/add-neovim.sh
}

# Install distrobox
dtfn_prompt "Install/update distrobox?" false && {
    wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
    dtfn_prompt "Install/refresh devbox?" false && distrobox assemble create --file "$CONFIG_DIR/debian/distrobox/distrobox.ini" 
}

# Install DE
dtfn_prompt "Install DE?" false && {
    . $SCRIPTS_DIR/debian/add-de.sh
    . $SCRIPTS_DIR/debian/add-kitty.sh
}

# Install theme
dtfn_prompt "Install theme?" false && {
    mkdir -p $HOME/.icons
    cd $HOME/.icons
    curl -LOsS https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-mocha-light-cursors.zip
    unzip catppuccin-mocha-light-cursors.zip
    rm -f catppuccin-mocha-light-cursors.zip
    cd $GIT_DIR
}

# Install fonts
dtfn_prompt "Install fonts?" false && {
    mkdir -p $HOME/.local/share/fonts
    cp -rf $ASSETS_DIR/shared/fonts/*.ttf $HOME/.local/share/fonts
    fc-cache -f -v
}

# Install starship
dtfn_prompt "Install starship?" false && {
    curl -sS https://starship.rs/install.sh | sh
}

# Run link script
. $SCRIPTS_DIR/debian/link-config.sh

# Clean up
dtfn_prompt "Clean up?" false && {
    #TODO: remember to remove .themes/openbox .config/openbox .config/polybar
    sudo apt purge lightdm light-locker lxrandr lxdm xfce4-power-manager xfce4-power-manager-plugins default-logind openbox lxappearance-obconf polybar 
    sudo apt autoremove
}

rm -Rf $TMP_DIR
