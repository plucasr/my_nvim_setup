-- utils/init.lua
-- Enable system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Normal mode mapping
vim.keymap.set('n', '<leader>c', '"+y', { remap = false })

-- Visual mode mapping
vim.keymap.set('v', '<leader>c', '"+y', { remap = false })

-- Insert mode mapping
vim.keymap.set('i', '<leader>c', '<C-r>+')

-- Add debug notification
vim.keymap.set('n', '<leader>d', function()
    local content = vim.fn.getreg('+')
    vim.notify("Clipboard content: " .. content)
end)

-- Setup colorscheme
vim.cmd("colorscheme kanagawa")

-- Enable line numbers
vim.wo.number = true
