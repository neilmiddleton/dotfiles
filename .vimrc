set shell=/bin/sh
set runtimepath+=$GOROOT/misc/vim

filetype off
filetype plugin indent off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic vundle setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/upAndDown'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-commentary'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/rbenv-ctags'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'goldfeld/vim-seek'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'mattn/emmet-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important basic setup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

let mapleader = "\<space>"
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
nmap <leader>n :NERDTreeToggle<cr>

" Let NERDTree work as a split explorer
let NERDTreeHijackNetrw=1

set wildchar=<Tab> wildmenu wildmode=full

set t_Co=256
set background=dark
set mouse=a
colorscheme molokai

set grepprg=ack
set grepformat=%f:%l:%m
let g:gitgutter_realtime = 0

set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set backspace=start,indent
set pastetoggle=<F2>
set noesckeys
set shiftround
set number
set hlsearch
set nowrap
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't look at stuff we can't open
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

autocmd BufWritePre * :%s/\s\+$//e

set directory=~/.tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp

let g:Powerline_symbols = 'fancy'
let g:ctrlp_lazy_update = 0
let g:ctrlp_working_path_mode = 'ra'

autocmd FileType ru,ruby,haml,eruby,rake,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

" append _ to expand the split
map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

set tw=80
set cc=+1

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Setup filetype, path and find
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.rb set filetype=ruby
autocmd BufNewFile,BufRead *.ru set filetype=ruby

autocmd FileType ruby set commentstring=#\ %s

augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END

" Relative lines switch
function! NumberToggle()
  if(&relativenumber == 1)
    let g:relativemode = 0
    set nornu
  else
    let g:relativemode = 1
    set rnu
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>

filetype plugin indent on
syntax on
