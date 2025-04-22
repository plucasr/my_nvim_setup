
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>go", ":NvimTreeFindFile<cr>", {silent = true, noremap = true})

require("nvim-tree").setup({
  -- ... other nvim-tree options ...
  view = {
    adaptive_size = false,
    width = 40,
    side = 'right',
    -- ... other view options ...
  },
  -- ... other nvim-tree options ...
})
