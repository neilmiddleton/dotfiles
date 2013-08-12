call pathogen#infect()
set shell=/bin/sh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important basic setup stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
nmap <leader>n :NERDTreeToggle<cr>

" Let NERDTree work as a split explorer
let NERDTreeHijackNetrw=1

set wildchar=<Tab> wildmenu wildmode=full

set t_Co=256
set background = "dark"
set mouse=a
colorscheme molokai

set grepprg=ack
set grepformat=%f:%l:%m

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

autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.rb set filetype=ruby
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd FileType ruby set commentstring=#\ %s

filetype plugin indent on
autocmd FileType ru,ruby,haml,eruby,rake,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

" Use ctrl-[hjkl] to select the active split!
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>

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

" Go(!)
set rtp+=/usr/local/Cellar/go/1.1.1/misc/vim
filetype plugin indent on
syntax on
