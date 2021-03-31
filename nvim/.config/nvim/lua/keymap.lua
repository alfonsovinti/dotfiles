local utils = require('utils')

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

-- telescope
utils.map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')

