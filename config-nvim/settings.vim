syntax on
set guioptions-=T             " remove toolbar (win32 gui)
set noequalalways             " dont resize layout when closing buffers
" set foldmethod=syntax       " done in treesitter
" set foldlevelstart=8
set ofu=syntaxcomplete#Complete " omni complete stuff
set scrolloff=3               " keep at least 3 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set sidescroll=1
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showfulltag               " show full completion tags
set noerrorbells              " no error bells please
set linebreak
set textwidth=79              " default textwidth is a max of 79
set formatoptions=qrn1j
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,d    " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set switchbuf=useopen
set wildmode=lastused,longest:full,list:longest
set wildignore+=*.o,*~,.lo    " ignore object files
set nowrap
set whichwrap+=<,>,h,l        " backspaces and cursor keys wrap to
set magic                     " Enable the "magic"
set nolist
set listchars=tab:›…,eol:¬,extends:❯,precedes:❮   " what to show in "set list" mode
set showbreak=↪\
set visualbell t_vb=          " Disable ALL bells
set notimeout
set ttimeout
set ttimeoutlen=10
set matchpairs+=<:>           " add < and > to match pairs
set tags=tags;/               " search recursively up for tags
set shell=/bin/bash
set matchtime=3
set splitright                " add new windows towards the right
set splitbelow                " ... and below
set winwidth=79
set clipboard=unnamed
au VimResized * :wincmd =     " resize splits when the window is resized
set colorcolumn=+1            " colored column at textwidth+1   
set viewoptions=folds,cursor
set sessionoptions=folds
keepjumps

" show trailing space characters & remove them?
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END
syntax match Special "\t"
syntax match Error "\s\+$"
syntax match Error " \+\t"me=e-1
let c_space_errors=1
au Syntax * syn match Error /\s\+$/ | syn match Error /^\s* \t\s*/
" ---

set wildmenu                  " menu has tab completion   
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

set dictionary=/usr/share/dict/words " more words!
set spellfile=$VIMRUNTIME/custom-dictionary.utf-8.add

" ---------------------------------------------------------------------------
"  backup options
set backup
set viewdir=~/.cache/vim/view
set undodir=~/.cache/vim/undo
set directory=~/.cache/vim/swap
set backupdir=~/.cache/vim/backup
set backupskip=/tmp/*,/private/tmp/*
set viminfo=%100,'100,/100,h,\"500,:100,n~/.cache/vim/info
set history=1024
set undoreload=10000
" set nowritebackup
" set noswapfile                " no swap file
" set undofile

" ---------------------------------------------------------------------------
" utf8 encoding, dont bomb files and keep encoding unchanged
set enc=utf8
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set nobomb
  set nowrap
  set fileencodings=utf-8,latin1
endif

" ---------------------------------------------------------------------------
" spelling...
if v:version >= 700
  setlocal spell spelllang=en_us
  nmap <LocalLeader>ss :set spell!<CR>
  " highlight mispelled 'the'
  syntax keyword WordError teh
endif
" default to no spelling
set nospell

" Return to the same settings/cursor/position when re-opening a file
" :help mkview
augroup AutoSaveGroup
    autocmd!
    autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadbview
augroup end

" autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
