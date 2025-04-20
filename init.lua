require('keymaps')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.opt.number = true
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank to system clipboard using <leader>c in normal mode
vim.keymap.set('n', '<leader>c', '"*y', { desc = 'Yank to Clipboard' })

-- Yank to system clipboard using <leader>c in visual mode
vim.keymap.set('v', '<leader>c', '"*y', { desc = 'Yank to Clipboard' })

require('plugins.lazy')
require('plugins.fugitive')
require('plugins.telescope')
require('plugins.harpoon')
require('plugins.nvimtree')
require('plugins.barbar')
require('plugins.undotree')
require('plugins.fterm')
