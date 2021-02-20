# required packages
packages=(
    "alacritty"
    "bat"
    "dialog"
    "feh"
    "firefox"
    "git"
    "htop"
    "i3"
    "i3blocks"
    "i3lock"
    "i3status"
    "lxappearance"
    "nvim"
    "nnn"
    "picom"
    "rofi"
    "sl"
    "tmux"
    "xsel"
    "zsh"
)

for package in "${packages[@]}"; do
    if ! command -v $package &> /dev/null
    then
        echo "$package [NOT FOUND]"
    else
        echo "$package [OK]"
    fi
done
