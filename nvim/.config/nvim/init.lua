-- Map leader
vim.g.mapleader = ' '

local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local execute = vim.api.nvim_command

-- Settings
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- Install plugins
require('plugins')

-- Key mappings
require('keymap')

-- Setup Lua language server using submodule
require('lsp')

-- Another option is to groups configuration in one folder
require('config')
