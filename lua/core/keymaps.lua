print("keymaps file is loading")
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Number of spaces for autoindent
vim.opt.softtabstop = 2  -- Number of spaces for <Tab> key in insert mode

vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>his', require("telescope").extensions.git_file_history.git_file_history, { desc = "Opening Git history"})
vim.keymap.set('n', '<S-n>', ':vsplit', { desc = 'Open Diffview' })
vim.keymap.set('x', '<leader>k', ":move '<-2<CR>gv=gv", {
  desc = 'Move selection up'
})
vim.keymap.set('n', '<leader>j', ":<C-u>move+<CR>", {
  desc = 'Move current line down'
})
vim.keymap.set('x', '<leader>j', ":move '>+1<CR>gv=gv", {
  desc = 'Move selection down'
})


