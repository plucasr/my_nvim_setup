-- Just TypeScript-specific configurations that aren't handled by typescript-tools
-- For example:
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'typescriptreact' },
  callback = function()
    -- TypeScript-specific keymaps or settings
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end
})
