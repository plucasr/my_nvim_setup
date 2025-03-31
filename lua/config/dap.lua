-- config/dap.lua
local ok, dap = pcall(require, 'dap')
if not ok then
  vim.notify("DAP not loaded!", vim.log.levels.WARN)
  return
end

-- Initialize nio before dapui
require('nio').setup()  -- Initialize nvim-nio

-- Then setup dapui
local dapui = require('dapui')
dapui.setup()

-- Basic key mappings
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

-- Auto open/close UI
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
