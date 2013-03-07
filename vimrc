let mapleader = ","

set guifont=Inconsolata:h18
color molokai
set wildchar=<Tab> wildmenu wildmode=full

set grepprg=ack
set grepformat=%f:%l:%m

set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set backspace=start,indent

set number
set hlsearch
syntax on

if has("gui_running")
  set guioptions=egmrt
endif
