set encoding=utf-8
filetype off
filetype plugin indent off
set nocompatible
set shell=/bin/zsh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic vundle setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

imap jk <Esc>

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/upAndDown'
Bundle 'tpope/vim-commentary'
Bundle 'Lokaltog/powerline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/rbenv-ctags'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'mattn/emmet-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ggreer/the_silver_searcher'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-heroku'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'jiangmiao/auto-pairs'
Bundle "pangloss/vim-javascript"
Bundle "thoughtbot/vim-rspec"
Bundle "tpope/vim-dispatch"

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
colorscheme tomorrow-night

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
filetype plugin indent on
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

let g:ackprg = 'ag --nogroup --nocolor --column'

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

" use space to clear searches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Shortcut to rapidly toggle `set list`
" nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" RSpec.vim mappings
let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_runner = "os_x_iterm"
map <Leader>y :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

filetype plugin indent on
syntax on

let g:vim_json_syntax_conceal = 0

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

let g:syntastic_javascript_jshint_conf = $HOME . '/.jshintrc'
