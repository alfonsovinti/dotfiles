return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'arcticicestudio/nord-vim' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Vim dispatch
  use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  -- use { 'tpope/vim-fugitive' }

  -- Vim windows nav
  use { 'christoomey/vim-tmux-navigator' }
  use { 'szw/vim-maximizer' }

  -- icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua' }

end)
