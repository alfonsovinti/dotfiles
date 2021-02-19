" disable F1 bringing up the help doc every time
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" disable paste on middle click
inoremap <MiddleMouse> <Nop>

" escaping
inoremap kj <Esc>
xnoremap kj <Esc>
cnoremap kj <C-c>

" moving lines
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv

" movements in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" center display line after searches
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#z

" clear search
noremap <silent> <Leader>c :let @/ = ""<CR>

" set working director
nnoremap <Leader>. :lcd %:p:h<CR>

" qq to record, Q to replay
nnoremap Q @q

" make Y from cursor to end, similarly to D and C
nnoremap Y y$

" toggle ui/option
noremap <silent> <Leader>Ts :set hlsearch! hlsearch?<CR> " toggle highlighted search
noremap <silent> <Leader>Tw :set wrap! wrap?<CR> " toggle line wrap

" tabs
nnoremap <silent> <Leader>t :tabnew<CR>
" switching tabs quickly
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<CR>

" buffers
nnoremap <Leader>ba <C-^>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprev<CR>

" widows
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
"nnoremap <Leader>wn  <C-w>w
"nnoremap <Leader>wp  <C-w>W
" split current window horizzontally
"nnoremap <Leader>w_  <C-w>s
" split current window vertically
"nnoremap <Leader>w\| <C-w>v
"nnoremap <Leader>H  <C-w>H
"nnoremap <Leader>J  <C-w>J
"nnoremap <Leader>K  <C-w>K
"nnoremap <Leader>L  <C-w>L
"nnoremap <Leader>wr  <C-w>r
"nnoremap <Leader>wx  <C-w>x

" map j to gj and k to gk, so line navigation ignores line wrap
" ...but only if the count is undefined (otherwise, things like 4j
" break if wrapped LINES are present)
"nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
"xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')


