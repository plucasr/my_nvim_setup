print("keymaps file is loading")
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.tabstop = 2      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- Number of spaces for autoindent
vim.opt.softtabstop = 2  -- Number of spaces for <Tab> key in insert mode

vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>his', require("telescope").extensions.git_file_history.git_file_history, { desc = "Opening Git history"})
