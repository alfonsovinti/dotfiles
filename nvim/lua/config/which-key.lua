require('which-key').setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g
    }
  },
  icons = {
    breadcrumb = '', -- symbol used in the command line area that shows your active key combo
    separator = '', -- '', -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 } -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3 -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

vim.cmd 'hi WhichKeySeparator guifg=#b48ead ctermfg=5'

local n_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<Leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local n_mappings = {
  c = {
    name = 'Code',
    c = { '<Plug>kommentary_line_default', 'Toggle comment' },
    C = { '<Plug>kommentary_motion_default', 'Motion comment' }
  },
  f = {
    name = 'Find',
    b = { '<cmd>Telescope buffers<CR>', 'Buffers' },
    d = { '<cmd>Telescope lsp_document_diagnostics<CR>', 'Document Diagnostics' },
    D = { '<cmd>Telescope lsp_workspace_diagnostics<CR>', 'Workspace Diagnostics' },
    f = { '<cmd>Telescope find_files<CR>', 'File' },
    g = { '<cmd>Telescope live_grep<CR>', 'Text' },
    h = { '<cmd>Telescope help_tags<CR>', 'Tags' },
    m = { '<cmd>Telescope marks<CR>', 'Marks' },
    M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
    r = { '<cmd>Telescope marks<CR>', 'Open Recent File' },
    R = { '<cmd>Telescope registers<CR>', 'Registers' }
  },
  g = {
    name = 'Git',
    b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
    B = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', 'Blame line' },
    s = { '<cmd>Neogit<CR>', 'Status' },
    a = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage hunk' },
    u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'Undo stage hunk' },
    r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset hunk' },
    R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset buffer' },
    p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview hunk' },
  },
  k = { '<cmd>let @/ = ""<CR>', 'Clear search' },
  l = { '<cmd>noh<CR>', 'Clear highlights' },
  t = {
    name = 'Toggles',
    s = { '<cmd>set hlsearch! hlsearch?<CR>', 'Highlighted search' },
    w = { '<cmd>set wrap! wrap?<CR>', 'Line wrap' }
  }
}

local v_opts = {
    mode = "v", -- VISUAL mode
    prefix = "<Leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local v_mappings = {
  c = {
    name = 'Code',
    c = { '<Plug>kommentary_visual_default', 'Toggle comment' }
  }
}

local wk = require("which-key")
wk.register(n_mappings, n_opts)
wk.register(v_mappings, v_opts)

