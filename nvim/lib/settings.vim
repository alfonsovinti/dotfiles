" set leader
let mapleader="\<Space>"

" security
set modelines=0

" hide buffers, not close them
set hidden

" maintain undo history between sessions
set undofile
set noswapfile
set nobackup

" add spaces not tab
set expandtab
set tabstop=4 softtabstop=4
" >> indents by 2 spaces.
set shiftwidth=4
" >> indents to next multiple of 'shiftwidth'.
set shiftround

" do indenting when starting a new line
set smartindent
" copy indent from current line
set autoindent

" search on current directory .nvimrc or .exrc files
set exrc

" searching
set hlsearch
set incsearch

" also shows partial off-screen results in a preview window
set icm=split

" number
set relativenumber
set number

" case insensitive
set ignorecase
set smartcase
set infercase

" enables 24-bit color
set termguicolors

" minimal number of screen lines to keep above and below the cursor
set scrolloff=6

" completeopt - TODO
" set completeopt=menuone,noinsert,noselect

" give more space for displaying messages
set cmdheight=2

" add extra columns
set colorcolumn=80
set signcolumn=yes

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0
"let g:netrw_winsize = 25
"let g:netrw_browse_split = 2

" short delay
set updatetime=50


