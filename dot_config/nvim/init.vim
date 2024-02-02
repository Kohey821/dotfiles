set runtimepath^=~/.vim runtimepath+=~/.vim/after

let &packpath = &runtimepath

source ~/.includes.vim/universal-rc.vim

if exists('g:vscode')
    source ~/.includes.vim/vscode-plugins.vim

    source ~/.includes.vim/vscode-rc.vim
else
    source ~/.includes.vim/plugins.vim

    source ~/.includes.vim/plugin-settings/coc.vim
    source ~/.includes.vim/plugin-settings/vfiler.vim
    source ~/.includes.vim/plugin-settings/vim-better-whitespace.vim
    source ~/.includes.vim/plugin-settings/vim-color-github.vim
    source ~/.includes.vim/plugin-settings/vim-indent-guides.vim
    source ~/.includes.vim/plugin-settings/vim-swap.vim

    source ~/.includes.vim/rc.vim
endif
