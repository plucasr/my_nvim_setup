-- config/plugins.lua
local plug_path = vim.fn.stdpath('config') .. '/autoload/plug.vim'

vim.cmd('source ' .. plug_path)

vim.call('plug#begin')
vim.call('plug#', 'nvim-tree/nvim-tree.lua')
vim.call('plug#', 'nvim-tree/nvim-web-devicons')
vim.call('plug#', 'rebelot/kanagawa.nvim')
vim.call('plug#', 'nvim-lua/plenary.nvim')
vim.call('plug#', 'nvim-treesitter/nvim-treesitter')
vim.call('plug#', 'nvim-telescope/telescope.nvim')
vim.call('plug#', 'tpope/vim-fugitive')

vim.call('plug#end')
