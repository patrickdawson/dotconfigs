vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smartindent")
vim.cmd("set scrolloff=2")
vim.g.mapleader = " "

-- line numbers
vim.cmd("set number")
vim.cmd("set number relativenumber")

-- search
-- vim.cmd("set nohlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- remappings
vim.keymap.set("i", "jj", "<ESC>", {})
vim.keymap.set("n", "gj", "<Ctrl+o>", {})
