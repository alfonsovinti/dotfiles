local utils = require('utils')
local cmd = vim.cmd

-- This is only necessary if you use "set termguicolors".
--cmd 'let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"'
--cmd 'let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"'

-- colorscheme
utils.opt('o', 'termguicolors', true)   -- enables 24-bit color
cmd 'colorscheme nord'

-- set trasparent bg
--cmd 'highlight Normal guibg=none'

-- completion
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- nvim-tree
vim.g.nvim_tree_ignore  = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_tab_open = 0
utils.map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "cpp", "dart", "erlang", "fennel", "kotlin", "ledger" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  --indent = {enable = true},
  --autotag = {enable = true},
}

-- setup color highlighter
require'colorizer'.setup()

-- indent guide
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_space_char = ''
--vim.g.indent_blankline_extra_indent_level = -1
vim.g.indent_blankline_enabled = false
--vim.g.indent_blankline_filetype_exclude = {'help', 'markdown'}
--vim.g.indent_blankline_buftype_exclude = {'terminal'}
--vim.g.indent_blankline_bufname_exclude = {'*.md'}

-- make ranger replace netrw and be the file explorer
vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_bw_enable = 1
--vim.g.rnvimr_border_attr = {'fg': 14, 'bg': -1}
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- disable kommentary default mappings
vim.g.kommentary_create_default_mappings = false

-- gitsigns
require('gitsigns').setup({
  signs = {
    add = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
    change = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true  -- If luajit is present
})

-- neogit
require("neogit").setup({
  disable_signs = false,
  disable_context_highlighting = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { "+", "-" },
    item = { "+", "-" },
    hunk = { "", "" },
  }
})
cmd 'hi NeogitNotificationInfo guifg=#a3be8c'
cmd 'hi NeogitNotificationWarning guifg=#ebcb8b'
cmd 'hi NeogitNotificationError guifg=#bf616a'
cmd 'hi def NeogitDiffAddHighlight guibg=#434c5e guifg=#a3be8c'
cmd 'hi def NeogitDiffDeleteHighlight guibg=#434c5e guifg=#bf616a'
cmd 'hi def NeogitDiffContextHighlight guibg=#3b4252 guifg=#d8dee9'
cmd 'hi def NeogitHunkHeader guifg=#e5e9f0 guibg=#434c5e'
cmd 'hi def NeogitHunkHeaderHighlight guifg=#e5e9f0 guibg=#4c566a'
