---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local assets_path = gfs.get_xdg_config_home() .. "awesome/assets/"

local theme = {}

theme.nord0  = "#2E3440"
theme.nord1  = "#3B4252"
theme.nord2  = "#434C5E"
theme.nord3  = "#4C566A"
theme.nord4  = "#D8DEE9"
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#81A1C1"
theme.nord10 = "#5E81AC"
theme.nord11 = "#BF616A"
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.font          = "FiraCode Nerd Font 11"

theme.bg_normal     = theme.nord0
theme.bg_focus      = theme.nord3
theme.bg_urgent     = theme.nord11
theme.bg_minimize   = theme.nord1
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.nord4
theme.fg_focus      = theme.nord6
theme.fg_urgent     = theme.nord4
theme.fg_minimize   = theme.nord4

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(3)
theme.border_normal = theme.nord1
theme.border_focus  = theme.nord15
theme.border_marked = theme.nord14

-- titlebar
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus  = theme.bg_focus
theme.titlebar_fg_normal = theme.fg_normal
theme.titlebar_fg_focus  = theme.fg_focus

-- taglist
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.nord15
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.nord15
)

-- tasklist_[bg|fg]_[focus|urgent]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]

-- notification
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- menu
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = assets_path .. "submenu.png"
theme.menu_height = dpi(20)
theme.menu_width  = dpi(140)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = assets_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus  = assets_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = assets_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = assets_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = assets_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = assets_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = assets_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = assets_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = assets_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = assets_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = assets_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = assets_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = assets_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = assets_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = assets_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = assets_path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = assets_path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = assets_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = assets_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = assets_path .. "titlebar/maximized_focus_active.png"

theme.wallpaper = assets_path .. "background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = assets_path .. "layouts/fairhw.png"
theme.layout_fairv = assets_path .. "layouts/fairvw.png"
theme.layout_floating  = assets_path .. "layouts/floatingw.png"
theme.layout_magnifier = assets_path .. "layouts/magnifierw.png"
theme.layout_max = assets_path .. "layouts/maxw.png"
theme.layout_fullscreen = assets_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = assets_path .. "layouts/tilebottomw.png"
theme.layout_tileleft   = assets_path .. "layouts/tileleftw.png"
theme.layout_tile = assets_path .. "layouts/tilew.png"
theme.layout_tiletop = assets_path .. "layouts/tiletopw.png"
theme.layout_spiral  = assets_path .. "layouts/spiralw.png"
theme.layout_dwindle = assets_path .. "layouts/dwindlew.png"
theme.layout_cornernw = assets_path .. "layouts/cornernww.png"
theme.layout_cornerne = assets_path .. "layouts/cornernew.png"
theme.layout_cornersw = assets_path .. "layouts/cornersww.png"
theme.layout_cornerse = assets_path .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:foldmethod=marker
