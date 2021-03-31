local utils = require('utils')
local cmd = vim.cmd

-- colorscheme
utils.opt('o', 'termguicolors', true)   -- enables 24-bit color
cmd 'colorscheme nord'

-- completion
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- fugitive
utils.map('n', '<Leader>gs', '<cmd>Gstatus<CR>') -- Git status

-- nvim-tree
vim.g.nvim_tree_ignore  = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_tab_open = 0
utils.map('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')
