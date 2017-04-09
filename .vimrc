" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"vim-go golang support
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'sbl/scvim'
Plug 'valloric/youcompleteme'

" COLOR SCHEMES
" Tomorrow
Plug 'ChrisKempson/Vim-Tomorrow-Theme'


" All of your Plugins must be added before the following line
"call vundle#end()            " required
call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

syntax on
set nocompatible
set number
set background=light 
colorscheme Tomorrow
set backspace=2
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" golang setting
let g:go_fmt_command ="goimports"
let g:go_fmt_autosave = 1

" scvim
let g:sclangTerm = "open -a iterm.app"
autocmd FileType mail setlocal fo+=aw
