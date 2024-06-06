
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"

echo " link $CONFIG_DIR"

ln -sf "$CONFIG_DIR/shared/starship/"starship.toml "$HOME/.config/"starship.toml
