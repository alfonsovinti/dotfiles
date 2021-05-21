-- Map leader
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local env = vim.env
local cmd = vim.cmd
local execute = vim.api.nvim_command

-- set env
env.XDG_CONFIG_HOME = env.XDG_CONFIG_HOME or fn.stdpath("config")
env.XDG_DATA_HOME = env.XDG_DATA_HOME or fn.stdpath("data")
env.XDG_CACHE_HOME = env.XDG_CACHE_HOME or fn.stdpath("cache")

-- Settings
require("settings")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
cmd([[packadd packer.nvim]])
-- Auto compile when there are changes in plugins.lua
cmd("autocmd BufWritePost plugins.lua PackerCompile")

-- Install plugins
require("plugins")

-- Key mappings
require("keymap")

-- Setup Lua language server using submodule
require("lsp")
require("lsp.bash-ls")
require("lsp.lua-ls")

-- Another option is to groups configuration in one folder
require("config")
require("config.galaxyline")
require("config.which-key")
