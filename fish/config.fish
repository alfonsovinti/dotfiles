
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
#set -e fish_user_paths
#set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# Supresses fish's intro message
set fish_greeting

# getting proper colors
set TERM "xterm-256color"

# dotfiles
set DOTFILES "$HOME/.dotfiles"

# XDG
set XDG_CONFIG_HOME "$HOME/.config"
set XDG_DATA_HOME "$HOME/.local/share"
set XDG_CACHE_HOME "$HOME/.cache"

#[[ ! -d "${XDG_CONFIG_HOME}" ]] && mkdir -p "${XDG_CONFIG_HOME}"
#[[ ! -d "${XDG_CACHE_HOME}" ]] && mkdir -p "${XDG_CACHE_HOME}"
#[[ ! -d "${XDG_DATA_HOME}" ]] && mkdir -p "${XDG_DATA_HOME}"

# editor
set EDITOR "emacsclient -t -a ''" # in terminal
set EDITOR "nvim" # in terminal
set VISUAL "emacsclient -c -a emacs" # GUI mode

# manpage most readable
#se -x MANPAGER "nvim -c 'set ft=man' -" # set neovim as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # set bat as manpager

# paths
#paths=(
#  "$HOME/bin"
#  "$HOME/.local/bin"
#  "$DOTFILES/bin"
#)

#for p in "${paths[@]}"; do
#  if [[ -d $p ]]; then
#    export PATH="$p:$PATH"
#  fi
#done

# set vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

# autocomplete and highlight
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# load aliases
source "$DOTFILES/misc/aliases"

# setting the starship prompt
starship init fish | source
