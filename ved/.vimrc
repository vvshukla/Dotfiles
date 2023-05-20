" Begin defining Vim plugins using vim-plug
call plug#begin()

" Add the 'sirver/ultisnips' plugin for code snippets
Plug 'sirver/ultisnips'

" Configure UltiSnips plugin settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

" End defining Vim plugins
call plug#end()

" Enable syntax highlighting
syntax enable

" Detect filetypes
filetype on
filetype plugin on
filetype indent on

" Set indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" General settings
set hidden         " Allow switching buffers without saving
set nobackup       " Don't create backup files
set noswapfile     " Disable swap files

" Search settings
set incsearch      " Incremental search
set nohlsearch     " Don't highlight search matches

" Line number settings
set number         " Display line numbers
set relativenumber " Display relative line numbers

" Disable error bells
set noerrorbells

" Set terminal color mode to 256 colors
set t_Co=256

" Set the number of lines to keep above and below the cursor
set scrolloff=8

" Show command in status line
set showcmd

" Automatically reload files if they change outside of Vim
set autoread

" Remove pipes '|' that act as separators on splits
set fillchars+=vert:\ 

" Open splits below and to the right
set splitbelow splitright

" Map keys for adjusting split sizes
noremap <silent> <C-Left> :vertical resize +1<CR>
noremap <silent> <C-Right> :vertical resize -1<CR>
noremap <silent> <C-Up> :resize +1<CR>
noremap <silent> <C-Down> :resize -1<CR>

" Set the leader key as the spacebar
let mapleader = "\<Space>"

" Map leader key shortcuts for window navigation
noremap <Leader>j <C-W><C-J>
noremap <Leader>k <C-W><C-K>
noremap <Leader>l <C-W><C-L>
noremap <Leader>h <C-W><C-H>

" Map leader key shortcut for opening a new vertical split
noremap <Leader>n :vs 

" Map leader key shortcuts for quitting and saving
noremap <Leader>q :q<CR>
noremap <Leader>w :wq<CR>

" Map leader key shortcut for selecting all
noremap <Leader>a ggVG

" Map leader key shortcut for sourcing the vimrc file
noremap <Leader>s :source ~/.vimrc<CR>

" Map leader key shortcuts for Python file commands
autocmd FileType python noremap <Leader>e :w <CR> :!python %<CR>
autocmd FileType python noremap <Leader>/ ^i# <ESC>
autocmd FileType python noremap <Leader>f :w <CR> :silent! execute '!black ' shellescape(expand('%')) . ' 2>&1 >/dev/null'<CR> :redraw!<CR>

" Map leader key shortcuts for C++ file commands
autocmd FileType cpp noremap <Leader>f :w <CR> :silent!! clang-format -i %<CR> :redraw!<CR>
autocmd FileType cpp noremap <Leader>c :w <CR> :!g++ -std=c++17 -Wshadow -Wall -DONPC -o .bin/%< % -O2 -Wno-unused-result && ./.bin/%< < .utils/inp<CR>
autocmd FileType cpp noremap <Leader>e :w <CR> :!g++ -std=c++17 -Wshadow -Wall -DONPC -o .bin/%< % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./.bin/%< < .utils/inp<CR>
autocmd FileType cpp noremap <Leader>r :w <CR> :!g++ -std=c++17 -Wshadow -Wall -DONPC -o .bin/%< % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./.bin/%< <CR>
autocmd FileType cpp noremap <Leader>/ ^i// <ESC>
autocmd FileType cpp noremap <Leader>\ ^xxx <ESC>
autocmd FileType cpp noremap <Leader>i <CR> :vs .utils/inp <CR>

" Map leader key shortcuts for Fortran file commands
autocmd FileType fortran noremap <Leader>e :w <CR> :!gfortran % -o %< && "./%<"<CR>
autocmd FileType fortran noremap <Leader>/ ^i! <ESC>
autocmd FileType fortran noremap <Leader>\ ^xx <ESC>

" Customize statusline colors
au InsertEnter * hi statusline ctermfg=6 ctermbg=NONE
au InsertLeave * hi statusline ctermfg=5 ctermbg=NONE
hi statusline ctermbg=NONE ctermfg=5 cterm=bold

" Set the statusline format
set laststatus=2
set statusline=%f
set statusline+=%y
set statusline+=%h
set statusline+=%m
set statusline+=%r
set statusline+=%=[col:%c]:[row:%l/%L]
