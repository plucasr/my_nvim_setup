-- init.lua
-- Load plug.vim first
local plug_path = vim.fn.stdpath('config') .. '/autoload/plug.vim'
vim.cmd('source ' .. plug_path)

-- Load plugins first
require('config.plugins')

-- Core utilities
require('config.utils.init')

-- Mason and LSP
require('config.mason')
require('config.lsp')  -- Your central LSP config

-- Completion
require('config.completion')

-- UI components
require('config.nvimtree')
require('config.treesitter')
require('config.telescope')

-- Debugging (loaded last with error handling)
local ok, _ = pcall(function()
  require('config.dap')
end)
if not ok then
  vim.notify("DAP configuration failed to load", vim.log.levels.WARN)
end

-- Language specific (loaded last)
require('config.typescript')
