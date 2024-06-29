## autorun.sh
## ====================
##

# Start LX PolicyKit
lxpolkit &

# Bg and Wallpaper
xsetroot -solid "#303446" &
nitrogen --restore &

# Start picom
picom --config $HOME/.config/picom/picom.conf &

# Start bars
#polybar -q &

# Start nm-applet
nm-applet &

# Volume keys daemon
#mate-volume-control-status-icon &
#audacious &

# Enable power management
mate-power-manager &

#blueman-applet &

# Start xscreensaver
xscreensaver -no-splash &

# Notification daemon
dunst &

## Start Clipboard manager
(sleep 3s && parcellite) &

# Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
# Adjust the values according to your preferances.
#xset r rate 250 25 &

# Turn on/off system beep
xset b off &

## Run the conky
conky -q &

# Hacks for notifyd since it switched to systemd
#/usr/lib/*/xfce4/notifyd/xfce4-notifyd &
