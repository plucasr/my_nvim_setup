-- config/plugins.lu

vim.call('plug#begin')

-- UI and colors
vim.call('plug#', 'nvim-tree/nvim-web-devicons')
vim.call('plug#', 'rebelot/kanagawa.nvim')

-- File tree
vim.call('plug#', 'nvim-tree/nvim-tree.lua')

-- Git
vim.call('plug#', 'tpope/vim-fugitive')

-- Treesitter
vim.call('plug#', 'nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
vim.call('plug#', 'nvim-treesitter/playground')

-- Telescope (requires plenary)
vim.call('plug#', 'nvim-lua/plenary.nvim')
vim.call('plug#', 'nvim-telescope/telescope.nvim')

-- LSP and completion
vim.call('plug#', 'neovim/nvim-lspconfig')
vim.call('plug#', 'williamboman/mason.nvim')
vim.call('plug#', 'williamboman/mason-lspconfig.nvim')
vim.call('plug#', 'hrsh7th/nvim-cmp')
vim.call('plug#', 'hrsh7th/cmp-nvim-lsp')
vim.call('plug#', 'hrsh7th/cmp-buffer')
vim.call('plug#', 'hrsh7th/cmp-path')
vim.call('plug#', 'hrsh7th/cmp-cmdline')
vim.call('plug#', 'L3MON4D3/LuaSnip')
vim.call('plug#', 'saadparwaiz1/cmp_luasnip')
vim.call('plug#', 'pmizio/typescript-tools.nvim', {
  ['do'] = ':TSUpdate'  -- Optional: install TypeScript automatically
})
-- Debugging (DAP)
vim.call('plug#', 'mfussenegger/nvim-dap')  -- Core DAP
vim.call('plug#', 'nvim-neotest/nvim-nio')
vim.call('plug#', 'rcarriga/nvim-dap-ui')  -- UI
vim.call('plug#', 'mfussenegger/nvim-dap-python')  -- Python adapter
vim.call('plug#', 'jay-babu/mason-nvim-dap.nvim')  -- Mason integration

vim.call('plug#end')
