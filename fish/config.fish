# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
#set -e fish_user_paths
#set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths
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
#set EDITOR "emacsclient -t -a ''" # in terminal
set EDITOR "nvim" # in terminal
set VISUAL "emacsclient -c -a emacs" # GUI mode

# manpage most readable
#se -x MANPAGER "nvim -c 'set ft=man' -" # set neovim as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # set bat as manpager

# set vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end

# set theme
set fish_color_normal normal
set fish_color_cancel -r
set fish_color_history_current --bold
set fish_pager_color_progress brwhite --background=cyan
set fish_color_search_match bryellow --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_param eceff4
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_description B3A06D yellow
set fish_pager_color_completion normal
set fish_color_host normal
set fish_color_user brgreen
set fish_color_autosuggestion 4c566a
set fish_color_valid_path --underline
set fish_color_cwd_root red
set fish_color_cwd green
set fish_color_escape 00a6b2
set fish_color_operator 00a6b2
set fish_color_command 81a1c1
set fish_color_quote a3be8c
set fish_color_redirection b48ead
set fish_color_end 88c0d0
set fish_color_error ebcb8b
set fish_color_comment 434c5e
set fish_color_match --background=brblue

# load aliases
source "$DOTFILES/misc/aliases"

# setting the starship prompt
starship init fish | source


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

# set theme
set fish_color_normal normal
set fish_color_cancel -r
set fish_color_history_current --bold
set fish_pager_color_progress brwhite --background=cyan
set fish_color_search_match bryellow --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_param eceff4
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_description B3A06D yellow
set fish_pager_color_completion normal
set fish_color_host normal
set fish_color_user brgreen
set fish_color_autosuggestion 4c566a
set fish_color_valid_path --underline
set fish_color_cwd_root red
set fish_color_cwd green
set fish_color_escape 00a6b2
set fish_color_operator 00a6b2
set fish_color_command 81a1c1
set fish_color_quote a3be8c
set fish_color_redirection b48ead
set fish_color_end 88c0d0
set fish_color_error ebcb8b
set fish_color_comment 434c5e
set fish_color_match --background=brblue

# load aliases
source "$DOTFILES/misc/aliases"

# setting the starship prompt
starship init fish | source
