local utils = require('utils')
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')

-- disable F1 bringing up the help doc every time
utils.map('i', '<F1>', '<Nop>')
utils.map('n', '<F1>', '<Nop>')
utils.map('v', '<F1>', '<Nop>')

-- disable paste on middle click
utils.map('i', '<MiddleMouse>', '<Nop>')

-- escaping
utils.map('i', 'kj', '<Esc>')
utils.map('x', 'kj', '<Esc>')
utils.map('c', 'kj', '<Esc>')

-- moving lines
utils.map('n', '<C-j>', '<Cmd>m .+1<CR>==')
utils.map('n', '<C-k>', '<Cmd>m .-2<CR>==')
utils.map('n', '<C-h>', '<<')
utils.map('n', '<C-l>', '>>')
utils.map('x', '<C-j>', '<Cmd>move\'>+<CR>gv')
utils.map('x', '<C-k>', '<Cmd>move-2<CR>gv')
utils.map('x', '<C-h>', '<gv')
utils.map('x', '<C-l>', '>gv')
utils.map('v', '<C-j>', '<Cmd>m \'>+1<CR>gv=gv')
utils.map('v', '<C-k>', '<Cmd>m \'<-2<CR>gv=gv')

-- movements in insert mode
utils.map('i', '<C-h>', '<C-o>h')
utils.map('i', '<C-l>', '<C-o>l')
utils.map('i', '<C-j>', '<C-o>j')
utils.map('i', '<C-k>', '<C-o>k')

-- center display line after searches
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
utils.map('n', '*', '*zz')
utils.map('n', '#', '#zz')
utils.map('n', 'g*', 'g*zz')
utils.map('n', 'g#', 'g#z')

-- clear search
utils.map('n', '<Leader>c', '<Cmd>let @/ = ""<CR>', {silent = true})

-- clear highlights
utils.map('n', '<Leader>l', '<Cmd>noh<CR>')

-- set working director
utils.map('n', '<Leader>.', '<Cmd>lcd %:p:h<CR>')

-- qq to record, Q to replay
utils.map('n', 'Q', '@q')

-- make Y from cursor to end, similarly to D and C
utils.map('n', 'Y', 'y$')

-- toggle ui/option
utils.map('n', '<Leader>Ts', '<Cmd>set hlsearch! hlsearch?<CR>', {silent = true}) -- toggle highlighted search
utils.map('n', '<Leader>Tw', '<Cmd>set wrap! wrap?<CR>', {silent = true}) -- toggle line wrap

-- tabs
utils.map('n', '<Leader>t', '<Cmd>tabnew<CR>', {silent = true})
-- switching tabs quickly
utils.map('n', '<Leader>1', '1gt')
utils.map('n', '<Leader>2', '2gt')
utils.map('n', '<Leader>3', '3gt')
utils.map('n', '<Leader>4', '4gt')
utils.map('n', '<Leader>5', '5gt')
utils.map('n', '<Leader>6', '6gt')
utils.map('n', '<Leader>7', '7gt')
utils.map('n', '<Leader>8', '8gt')
utils.map('n', '<Leader>9', '9gt')
utils.map('n', '<Leader>0', '<Cmd>tablast<CR>')

-- buffers
utils.map('n', '<Leader>ba', '<C-^>')
utils.map('n', 'gb', '<Cmd>bnext<CR>')
utils.map('n', 'gB', '<Cmd>bprev<CR>')

-- windows
vim.g.tmux_navigator_no_mappings = 1
utils.map('n', '<M-h>', ':TmuxNavigateLeft<cr>', {silent = true})
utils.map('n', '<M-j>', ':TmuxNavigateDown<cr>', {silent = true})
utils.map('n', '<M-k>', ':TmuxNavigateUp<cr>', {silent = true})
utils.map('n', '<M-l>', ':TmuxNavigateRight<cr>', {silent = true})
utils.map('n', '<M-\\>', ':TmuxNavigatePrevious<cr>', {silent = true})
-- split current window horizzontally
utils.map('n', '<M-_>', '<C-w>s', {silent = true})
-- split current window vertically
utils.map('n', '<M-|>', '<C-w>v', {silent = true})
-- mooving windows
utils.map('n', '<M-H>', '<C-w>H', {silent = true})
utils.map('n', '<M-J>', '<C-w>J', {silent = true})
utils.map('n', '<M-K>', '<C-w>K', {silent = true})
utils.map('n', '<M-L>', '<C-w>L', {silent = true})
-- resize windows
utils.map('n', '<M-C-k>', '<C-w>+', {silent = true})
utils.map('n', '<M-C-j>', '<C-w>-', {silent = true})
utils.map('n', '<M-C-h>', '<C-w><', {silent = true})
utils.map('n', '<M-C-l>', '<C-w>>', {silent = true})
utils.map('n', '<M-=>', '<C-w>=', {silent = true})
-- full screen
vim.g.maximizer_default_mapping_key = '<M-f>'

-- telescope
utils.map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')

-- map j to gj and k to gk, so line navigation ignores line wrap
-- ...but only if the count is undefined (otherwise, things like 4j
-- break if wrapped LINES are present)
cmd 'nnoremap <expr> j (v:count == 0 ? \'gj\' : \'j\')'
cmd 'nnoremap <expr> k (v:count == 0 ? \'gk\' : \'k\')'
cmd 'xnoremap <expr> j (v:count == 0 ? \'gj\' : \'j\')'
cmd 'xnoremap <expr> k (v:count == 0 ? \'gk\' : \'k\')'

-- TODO da modificare, sovrascrive altre keymap
-- Opens an edit command with the path of the currently edited file filled in
cmd 'noremap <Leader>e :ee <C-R>=expand("%:p:h") . "/" <CR>'
-- Opens a tab edit command with the path of the currently edited file filled
cmd 'noremap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>'
-- Opens a vertical split edit command with the path of the currently edited file filled
cmd 'noremap <Leader>es :vsplit <C-R>=expand("%:p:h") . "/" <CR>'
