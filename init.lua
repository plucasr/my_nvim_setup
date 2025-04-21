vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/lua')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.opt.number = true
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank to system clipboard using <leader>c in normal mode
vim.keymap.set('n', '<leader>c', '"*y', { desc = 'Yank to Clipboard' })

-- Yank to system clipboard using <leader>c in visual mode
vim.keymap.set('v', '<leader>c', '"*y', { desc = 'Yank to Clipboard' })

-- cmd + a to select the whole file content
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select All' })
vim.keymap.set('v', '<leader>a', 'ggVG', { desc = 'Select All' }) -- Also in visual mode
vim.keymap.set('v', '<leader>l', 'V', { desc = 'Select line' }) -- Also in visual mode
vim.keymap.set('n', '<leader>l', 'V', { desc = 'Select line' }) -- Also in visual mode

require('core.lazy')
require('core.keymaps')
require('plugins') 
