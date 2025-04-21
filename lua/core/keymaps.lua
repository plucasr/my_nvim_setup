print("keymaps file is loading")
vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>his', require("telescope").extensions.git_file_history.git_file_history, { desc = "Opening Git history"})
