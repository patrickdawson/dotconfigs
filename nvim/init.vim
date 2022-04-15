syntax on

source ~/dotconfigs/vim/common.vim

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
