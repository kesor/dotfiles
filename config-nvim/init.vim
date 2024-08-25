" NVIM Configuration file
" :help init.vim

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
" set loadplugins

lua << EOF
vim.loader.enable()
EOF

" disable some distro /usr/share/nvim/runtime/* plugins
let g:loaded_2html_plugin = 1
let g:skip_loading_mswin = 1

" set <Leader> and <LocalLeader>
let mapleader=' '
let maplocalleader='\'

" nvim-tree overrides netrw
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

" lazy.nvim plugins
runtime plugins.lua

" enable colors in the terminal
set termguicolors

" disable the empty-file vim message
set shortmess+=I

" allow plugins to hide characters when replacing with unicode icons
" set conceallevel=2
" messes with json quotes as indent-blankline conceals them
set conceallevel=0

" what to show in "set list" mode
set listchars=tab:›…,eol:¬,extends:❯,precedes:❮
set nolist

" show padding on left for signs
set signcolumn=yes:2

" source misc convenience settings to make vim feel at home
runtime settings.vim
runtime settings.lua

" all the keys!
runtime keymaps.lua

" all the colors!
runtime syntax.vim
