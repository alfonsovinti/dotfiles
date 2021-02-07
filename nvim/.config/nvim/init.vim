
"if empty($XDG_CONFIG_HOME)
"  let $XDG_CONFIG_HOME = $HOME . '/.config'
"endif
"if empty($XDG_DATA_HOME)
"  let $XDG_DATA_HOME = $HOME . '/.local/share'
"endif
"if empty($XDG_CACHE_HOME)
"  let $XDG_CACHE_HOME = $HOME . '/.cache'
"endif

"let $NVIM_LIB_HOME = $HOME . '/.dotfiles/nvim/lib'
"let $MYVIMRC = $XDG_CONFIG_HOME . '/nvim/init.vim'

"let configs = [
"\  "general",
"\  "ui",
"\  "commands",
"\  "plugins",
"\  "plugin-settings",
"\]
"for file in configs
"  let x = expand("~/.vim/".file.".vim")
"  if filereadable(x)
"    execute 'source' x
"  endif
"endfor
