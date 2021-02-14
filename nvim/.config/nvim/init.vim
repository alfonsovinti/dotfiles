if empty($XDG_CONFIG_HOME)
    let $XDG_CONFIG_HOME = $HOME . '/.config'
endif
if empty($XDG_DATA_HOME)
    let $XDG_DATA_HOME = $HOME . '/.local/share'
endif
if empty($XDG_CACHE_HOME)
    let $XDG_CACHE_HOME = $HOME . '/.cache'
endif
if empty($NVIM_DOTFILES_DIR)
    let $NVIM_DOTFILES_DIR = $HOME . '/.dotfiles/nvim'
endif

let configs = [
\    'settings',
\    'commands',
\    'plugins',
\    'mappings',
\    'plugin-settings',
\]
for file in configs
    let x = expand($NVIM_DOTFILES_DIR.'/lib/'.file.'.vim')
    if filereadable(x)
        execute 'source' x
    endif
endfor
