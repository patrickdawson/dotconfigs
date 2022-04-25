 syntax on

source ~/dotconfigs/vim/common.vim

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox

" telescope config
source ~/dotconfigs/nvim/telescope.vim
source ~/dotconfigs/nvim/nerdtree.vim
