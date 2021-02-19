let s:bundle_dir = $XDG_CONFIG_HOME.'/nvim/bundle'
let s:plug_path  = $XDG_CONFIG_HOME.'/nvim/autoload/plug.vim'

" check whether vim-plug is installed and install it if necessary
if !filereadable(s:plug_path)
  if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif
  echo 'Installing Vim-Plug...'
  echo ''
  let s:plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  call system('curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs ' . s:plug_url)
  if v:shell_error
    echoerr 'Error downloading vim-plug. Please install it manually.\n'
    execute 'q!'
  endif
  execute 'source  '.s:plug_path
  let g:not_finish_vimplug = 'yes'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

let g:plug_shallow = 0
let g:plug_window  = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'

call plug#begin(s:bundle_dir)

" apparance and themes
Plug 'arcticicestudio/nord-vim'

Plug 'christoomey/vim-tmux-navigator'
call plug#end()
