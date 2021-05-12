#       __  ___      ___
#      /""\|"  \    /"  |
#     /    \\   \  //  /   Alfonso Vinti (alfonsovinti)
#    /' /\  \\\  \/. ./    https://www.alfonsovinti.it
#   //  __'  \\.    //     https://github.com/alfonsovinti
#  /   /  \\  \\\   /
# (___/    \___)\__/
#
# qtile/config.py

import os
import subprocess
import socket

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"),
    Key([mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"),
    Key([mod], "j",
        lazy.layout.down(),
        desc="Move focus down"),
    Key([mod], "k",
        lazy.layout.up(),
        desc="Move focus up"),
    Key([mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        lazy.layout.section_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        lazy.layout.section_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"),

    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='Toggle floating'),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='Toggle fullscreen'),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal + " -e fish"), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]

groups = [
    Group('home'),
    Group('dev'),
    Group('www'),
    Group('sys'),
    Group('doc'),
]

for i, g in enumerate(groups, 1):
    keys.extend([
        # switch to group
        Key([mod], str(i), lazy.group[g.name].toscreen(),
            desc="Switch to group {}".format(g.name)),

        # move focused window to group
        Key([mod, "shift"], str(i), lazy.window.togroup(g.name),
            desc="Move focused window to group {}".format(g.name)),

        # switch to & move focused window to group
        Key([mod, "control"], str(i), lazy.window.togroup(g.name, switch_group=True),
            desc="Move focused window to group {}".format(g.name)),
    ])

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "#b48ead",
    "border_normal": "#434c5e"
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Columns(border_focus_stack='#b48ead'),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [["#2e3440", "#2e3440"], # 0
          ["#3b4252", "#3b4252"], # 1
          ["#434c5e", "#434c5e"], # 2
          ["#4c566a", "#4c566a"], # 3
          ["#d8dee9", "#d8dee9"], # 4
          ["#e5e9f0", "#e5e9f0"], # 5
          ["#eceff4", "#eceff4"], # 6
          ["#8fbcbb", "#8fbcbb"], # 7
          ["#88c0d0", "#88c0d0"], # 8
          ["#81a1c1", "#81a1c1"], # 9
          ["#5e81ac", "#5e81ac"], # 10
          ["#bf616a", "#bf616a"], # 11
          ["#d08770", "#d08770"], # 12
          ["#ebcb8b", "#ebcb8b"], # 13
          ["#a3be8c", "#a3be8c"], # 14
          ["#b48ead", "#b48ead"]] # 15

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='FiraCode Nerd Font',
    fontsize=13,
    padding=2,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    padding = 10,
                    text = 'ﮊ',
                    background = colors[0],
                    foreground = colors[15],
                    fontsize = 20
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 3,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.CurrentLayoutIcon(
                    padding = 0,
                    scale = 0.4,
                ),
                #widget.CurrentLayout(),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.GroupBox(
                    font = "FiraCode Nerd Font Bold",
                    fontsize = 9,
                    margin_y = 3,
                    margin_x = 0,
                    padding_y = 5,
                    padding_x = 3,
                    borderwidth = 3,
                    active = colors[4],
                    inactive = colors[3],
                    rounded = False,
                    highlight_color = colors[1],
                    highlight_method = "line",
                    this_current_screen_border = colors[15],
                    this_screen_border = colors[15],
                    other_current_screen_border = colors[15],
                    other_screen_border = colors[15],
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.Prompt(
                    padding = 10,
                    prompt = prompt,
                    font = "FiraCode Nerd Font",
                    foreground = colors[11],
                    background = colors[1]
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 30,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.WindowName(
                    padding = 0,
                    foreground = colors[7],
                ),
                widget.Chord(
                    padding = 0,
                    chords_colors={
                        'launch': (colors[11][0], colors[4][0]),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 30,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.Net(
                    padding = 0,
                    interface = "wlp4s0",
                    format = '{down} ↓↑ {up}',
                    foreground = colors[12],
                    update_interval = 5
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.CPU(
                    padding = 0,
                    format = " {freq_current}GHz {load_percent}% ",
                    foreground = colors[10],
                ),
                widget.Memory(
                    padding = 0,
                    format = " {MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}",
                    foreground = colors[10],
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.ThermalSensor(
                    padding = 0,
                    foreground = colors[11],
                    fmt = " {} "
                ),
                widget.NvidiaSensors(
                    padding = 0,
                    foreground = colors[11],
                    format = " {temp}°C"
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.CheckUpdates(
                    padding = 0,
                    update_interval = 1800,
                    distro = "Arch",
                    display_format = "⟳ {updates} Updates",
                    mouse_callbacks = {
                        'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')
                    },
                    colour_have_updates = colors[14],
                    foreground = colors[4],
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.Systray(
                    padding = 0,
                    #icon_size = 22
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.Volume(
                    padding = 0,
                    emoji = False,
                    fmt = "墳 {}",
                    #fontsize = 18,
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.Clock(
                    padding = 0,
                    format='%d/%m/%Y %a %H:%M'
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 5,
                    foreground = colors[4],
                    background = colors[0]
                ),
                widget.QuickExit(
                    default_text = " ",
                    countdown_format = "{}",
                    fontsize = 16,
                    padding = 4,
                    foreground = colors[11]
                ),
                # widget.Sep(
                #     linewidth = 0,
                #     padding = 8,
                #     foreground = colors[4],
                #     background = colors[0]
                # ),
            ],
            32,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def start_once():
    autostart_script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([autostart_script])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
