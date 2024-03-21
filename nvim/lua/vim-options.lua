vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smartindent")
vim.cmd("set scrolloff=2")
vim.g.mapleader = " "
vim.opt.swapfile = false

-- line numbers
vim.cmd("set number")
vim.cmd("set number relativenumber")

-- search
-- vim.cmd("set nohlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- remappings
vim.keymap.set("i", "jj", "<ESC>", {})
vim.keymap.set("n", "gj", "<Ctrl+o>", {})
vim.keymap.set("n", "gk", "<Ctrl+i>", {})


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')

