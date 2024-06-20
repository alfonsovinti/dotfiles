
mkdir -p $HOME/.config
# base
ln -sf $CONFIG_DIR/shared/starship/starship.toml $HOME/.config/starship.toml
ln -sf $CONFIG_DIR/shared/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $CONFIG_DIR/debian/bash/bashrc $HOME/.bashrc
ln -sf $CONFIG_DIR/debian/misc/inputrc $HOME/.inputrc

# neovim
mkdir -p $HOME/.config/nvim
ln -sf $CONFIG_DIR/shared/nvim/init.lua $HOME/.config/nvim/init.lua

# kitty
mkdir -p $HOME/.config/kitty
ln -sf $CONFIG_DIR/shared/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# bat
mkdir -p $HOME/.config/bat
mkdir -p $HOME/.config/bat/themes
ln -sf $CONFIG_DIR/debian/bat/config $HOME/.config/bat/config
ln -sf $CONFIG_DIR/debian/bat/themes/*.tmTheme $HOME/.config/bat/themes/
bat cache --build

# openbox
mkdir -p $HOME/.config/openbox
ln -sf $CONFIG_DIR/debian/openbox/rc.xml $HOME/.config/openbox/rc.xml
ln -sf $CONFIG_DIR/debian/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -sf $CONFIG_DIR/debian/openbox/menu.systemd.xml $HOME/.config/openbox/menu.systemd.xml
ln -sf $CONFIG_DIR/debian/openbox/environment $HOME/.config/openbox/environment
ln -sf $CONFIG_DIR/debian/openbox/autostart $HOME/.config/openbox/autostart
sudo ln -sf $RESOURCES_DIR/debian/bin/ob-exit /usr/bin

# polybar
mkdir -p $HOME/.config/polybar
ln -sf $CONFIG_DIR/debian/polybar/config.ini $HOME/.config/polybar/config.ini
ln -sf $CONFIG_DIR/debian/polybar/themes/mocha.ini $HOME/.config/polybar/theme.ini

# conky
mkdir -p $HOME/.config/conky
ln -sf $CONFIG_DIR/debian/conky/mocha.conf $HOME/.config/conky/conky.conf

# picom
mkdir -p $HOME/.config/picom
ln -sf $CONFIG_DIR/debian/picom/picom.conf $HOME/.config/picom/picom.conf
