" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ag.vim
Plugin 'rking/ag.vim'

" vim-hackernews
Plugin 'ryanss/vim-hackernews'

" Vim-fugitive
Plugin 'tpope/vim-fugitive'

" vim-repeat
Plugin 'tpope/vim-repeat'

" vim-surround
Plugin 'tpope/vim-surround'

" NERDTREE
Plugin 'scrooloose/nerdtree'

" CTRLP
Plugin 'kien/ctrlp.vim'

" vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

" easymotion
Plugin 'lokaltog/vim-easymotion'

" COLOR SCHEMES
" Solarized
Plugin 'altercation/vim-colors-solarized'

" Vividchalk
Plugin 'tpope/vim-vividchalk'

" Distinguished
Plugin 'Lokaltog/vim-distinguished'

" Tomorrow
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'

" scvim
Plugin 'sbl/scvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set nocompatible
set number
set background=light 
colorscheme Tomorrow
set backspace=2
set expandtab
set shiftwidth=2
set softtabstop=2
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" scvim
let g:sclangTerm = "open -a iterm.app"

autocmd FileType mail setlocal fo+=aw
