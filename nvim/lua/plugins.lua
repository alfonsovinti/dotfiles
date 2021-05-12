return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

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

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Vim dispatch
  -- use { 'tpope/vim-dispatch' }

  -- Git
  use {
    'TimUntersberger/neogit',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- which-key
  use { 'folke/which-key.nvim' }

  -- Vim windows nav
  use { 'christoomey/vim-tmux-navigator' }
  use { 'szw/vim-maximizer' }

  -- icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- use ranger in neovim
  use { 'kevinhwang91/rnvimr' }

  -- high-performance color highlighter
  use { 'norcalli/nvim-colorizer.lua' }

  -- indent blankline
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- language support
  use { 'dag/vim-fish' }

end)
