-- cmd + a to select the whole file content
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select All' })
vim.keymap.set('v', '<leader>a', 'ggVG', { desc = 'Select All' }) -- Also in visual mode
vim.keymap.set('v', '<leader>l', 'V', { desc = 'Select line' }) -- Also in visual mode
vim.keymap.set('n', '<leader>l', 'V', { desc = 'Select line' }) -- Also in visual mode

