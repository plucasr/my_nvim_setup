-- Normal mode
vim.keymap.set('n', '<leader><Left>', ':BufferPrevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader><Right>', ':BufferNext<CR>', { desc = 'Next Buffer' })

vim.keymap.set('n', '<leader>w', '<Cmd>BufferClose<CR>', { desc = "Close tab" })

