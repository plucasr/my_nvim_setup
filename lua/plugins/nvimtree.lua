
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>go", ":NvimTreeFindFile<cr>", {silent = true, noremap = true})

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    width = 40,
    side = 'right',
  },
})
