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
    "pcmanfm-gtk3"
    #"xarchiver"
    #"gvfs" # (optional) for trash support, mounting with udisks and remote filesystems
    "lxappearance-gtk3"
    #"lxinput-gtk3"
    #"lxrandr-gtk3"
    "arandr"
    "lxsession-gtk3"
    "picom"          # composer
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
)

aurp=(
    "neovim-git"
)

for package in "${packages[@]}"; do
    if ! command -v $package &> /dev/null
    then
        echo "$package [NOT FOUND]"
    else
        echo "$package [OK]"
    fi
done



