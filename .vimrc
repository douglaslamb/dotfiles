call plug#begin('~/.vim/plugged')

"vim-go golang support
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'supercollider/scvim'
Plug 'valloric/youcompleteme'

" COLOR SCHEMES
" Tomorrow
Plug 'ChrisKempson/Vim-Tomorrow-Theme'

call plug#end()

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

" to enable airline
set laststatus=2

" custom open NERDTree
map <C-n> :NERDTreeToggle<CR>
