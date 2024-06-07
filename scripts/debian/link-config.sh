
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

ln -sf $CONFIG_DIR/shared/starship/starship.toml $HOME/.config/starship.toml
ln -sf $CONFIG_DIR/shared/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $CONFIG_DIR/debian/bash/bashrc $HOME/.bashrc
