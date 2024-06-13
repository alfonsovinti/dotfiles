
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/openbox

ln -sf $CONFIG_DIR/shared/starship/starship.toml $HOME/.config/starship.toml
ln -sf $CONFIG_DIR/shared/tmux/tmux.conf $HOME/.tmux.conf

ln -sf $CONFIG_DIR/debian/bash/bashrc $HOME/.bashrc
ln -sf $CONFIG_DIR/debian/misc/inputrc $HOME/.inputrc
ln -sf $CONFIG_DIR/debian/polybar/config.ini $HOME/.config/polybar/config.ini

# openbox
ln -sf $CONFIG_DIR/debian/openbox/rc.xml $HOME/.config/openbox/rc.xml
ln -sf $CONFIG_DIR/debian/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -sf $CONFIG_DIR/debian/openbox/environment $HOME/.config/openbox/environment
ln -sf $CONFIG_DIR/debian/openbox/autostart $HOME/.config/openbox/autostart
