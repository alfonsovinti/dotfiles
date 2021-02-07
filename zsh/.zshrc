# dotfiles
export DOTFILES="$HOME/.dotfiles"

# dotfiles config dir
export ZSH_DOTFILES_DIR="$DOTFILES/zsh"
export NVIM_DOTFILES_DIR="$DOTFILES/nvim"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#ZDOTDIR=$HOME/.config/zsh

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# manpage most readable
export MANPAGER="nvim -c 'set ft=man' -"

# paths
paths=(
  "$HOME/bin"
  "$HOME/.local/bin"
  "$DOTFILES/bin" 
)

for p in "${paths[@]}"; do
  if [[ -d $p ]]; then
    export PATH="$p:$PATH"
  fi
done

# load configs
configs=(
  "autocompletion"
  "history"
  "keybindings"
  "prompt"
  "aliases"
)

for config in "${configs[@]}"; do
  if [[ -f "$ZSH_DOTFILES_DIR/lib/$config.zsh" ]]; then
    source "$ZSH_DOTFILES_DIR/lib/$config.zsh"
  fi
done
