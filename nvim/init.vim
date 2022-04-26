 syntax on

source ~/dotconfigs/vim/common.vim

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'terryma/vim-multiple-cursors'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox

source ~/dotconfigs/nvim/telescope.vim
source ~/dotconfigs/nvim/nerdtree.vim
source ~/dotconfigs/nvim/coc.vim

