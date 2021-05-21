-- galaxyline
local gl = require("galaxyline")
local colors = {
  -- bg = "#2E2E2E",
  bg = "#292D38",
  yellow = "#DCDCAA",
  dark_yellow = "#D7BA7D",
  cyan = "#4EC9B0",
  green = "#608B4E",
  light_green = "#B5CEA8",
  string_orange = "#CE9178",
  orange = "#FF8800",
  purple = "#C586C0",
  magenta = "#D16D9E",
  grey = "#858585",
  blue = "#569CD6",
  vivid_blue = "#4FC1FF",
  light_blue = "#9CDCFE",
  red = "#D16969",
  error_red = "#F44747",
  info_yellow = "#FFCC66"
}
local gls = gl.section

gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.purple,
        [""] = colors.purple,
        V = colors.purple,
        c = colors.magenta,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      -- return "▊ "
      return "  "
    end,
    highlight = { colors.red, colors.bg }
  }
}

local mode_map = {
  ["n"] = {"NORMAL", colors.fg3, colors.bg2},
  -- ["n"] = {"NORMAL", colors.bright_green, colors.faded_green},
  ["i"] = {"INSERT", colors.bright_blue, colors.faded_blue},
  ["R"] = {"REPLACE", colors.bright_red, colors.faded_red},
  ["v"] = {"VISUAL", colors.bright_orange, colors.faded_orange},
  ["V"] = {"V-LINE", colors.bright_orange, colors.faded_orange},
  ["c"] = {"COMMAND", colors.bright_yellow, colors.faded_yellow},
  ["s"] = {"SELECT", colors.bright_orange, colors.faded_orange},
  ["S"] = {"S-LINE", colors.bright_orange, colors.faded_orange},
  ["t"] = {"TERMINAL", colors.bright_aqua, colors.faded_aqua},
  [""] = {"V-BLOCK", colors.bright_orange, colors.faded_orange},
  [""] = {"S-BLOCK", colors.bright_orange, colors.faded_orange},
  ["Rv"] = {"VIRTUAL"},
  ["rm"] = {"--MORE"},
}


--[[ print(vim.fn.getbufvar(0, "ts"))
vim.fn.getbufvar(0, "ts") ]]
