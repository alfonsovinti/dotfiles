#! /bin/bash

set -e

# Variables setup
#BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly GIT_DIR=$(git rev-parse --show-toplevel)
readonly CONFIG_DIR="$GIT_DIR/config"
readonly ASSETS_DIR="$GIT_DIR/assets"
readonly SCRIPTS_DIR="$GIT_DIR/scripts"
readonly OFS="\n"


#if [ -z "$1" ]; then
#    echo -e "\nPlease call '$0 <argument>' to run this command!\n"
#    exit 1
#fi

dtfn_read () {
    if [ -z "$1" ]; then
        echo -e "\nPlease call 'dtfn_read <argument>' to run this command!\n"
        exit 1
    fi

    local val
    echo -n "$1: "
    read val
    return $val
}


# pkg = podman curl wget git htop iftop iotop neofetch


# TODO wget -qO- https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

# TODO https://github.com/deinsoftware



dtfn_read "input"
echo "There are lines in $?"

