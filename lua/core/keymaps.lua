print("keymaps file is loading")
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Number of spaces for autoindent
vim.opt.softtabstop = 2  -- Number of spaces for <Tab> key in insert mode

vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = 'Close Diffview' })
vim.keymap.set('n', '<leader>his', require("telescope").extensions.git_file_history.git_file_history, { desc = "Opening Git history"})
vim.keymap.set('n', '<S-n>', ':vsplit<CR>', { desc = 'Open Diffview' })
vim.keymap.set('x', '<leader>k', ":move '<-2<CR>gv=gv", {
  desc = 'Move selection up'
})
vim.keymap.set('n', '<leader>j', ":<C-u>move+<CR>", {
  desc = 'Move current line down'
})
vim.keymap.set('x', '<leader>j', ":move '>+1<CR>gv=gv", {
  desc = 'Move selection down'
})
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>.', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '<leader>/', vim.diagnostic.setloclist, { desc = 'Show all diagnostics in quickfix' })

-- Code actions
vim.keymap.set('n', '-ac', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('v', '-ac', vim.lsp.buf.code_action, { desc = 'Code Action' })

