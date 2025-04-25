local carbon = require('carbon-now')
carbon.setup({
  options = {
    theme = "solarized",
    font_family = "Monoid",
  }
})

vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true })
vim.opt.foldtext = "v:lua.require('config.folding').custom_fold_text()"

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return string.format("⏷ %s (%d lines) ", line:gsub("^%s*", ""), line_count)
end
