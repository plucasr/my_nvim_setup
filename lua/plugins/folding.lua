-- Enable folding with Treesitter if available, otherwise use syntax
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99 -- Open all folds by default
vim.opt.foldenable = true

-- Fallback to syntax folding if Treesitter isn't available
if not pcall(require, "nvim-treesitter") then
  vim.opt.foldmethod = "syntax"
end

-- Keybindings for easier folding
local keymap = vim.keymap.set
keymap("n", "<leader>zc", "zc", { desc = "Close fold" }) -- Close current fold
keymap("n", "<leader>zo", "zo", { desc = "Open fold" })  -- Open current fold
keymap("n", "<leader>za", "za", { desc = "Toggle fold" }) -- Toggle current fold
keymap("n", "<leader>zR", "zR", { desc = "Open all folds" })
keymap("n", "<leader>zM", "zM", { desc = "Close all folds" })

-- Optional: Auto-close folds when opening file
vim.api.nvim_create_autocmd({ "BufReadPost", "FileType" }, {
  pattern = "*",
  callback = function()
    vim.cmd("normal zR") -- Open all folds when opening a file
  end,
})
