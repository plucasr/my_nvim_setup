-- Open/close the debug UI
vim.keymap.set('n', '<leader>du', ':DapUI<CR>', { desc = 'Toggle Debug UI' })

-- Toggle breakpoints
vim.keymap.set('n', '<F9>', ':DapToggleBreakpoint<CR>', { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', { desc = 'Toggle Breakpoint' }) -- Alternative

-- Start debugging (continue if already started)
vim.keymap.set('n', '<F5>', ':DapContinue<CR>', { desc = 'Start/Continue Debugging' })

-- Step over
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { desc = 'Step Over' })

-- Step into
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { desc = 'Step Into' })

-- Step out
vim.keymap.set('n', '<S-F11>', ':DapStepOut<CR>', { desc = 'Step Out' })

-- Evaluate expression
vim.keymap.set('n', '<leader>de', ':DapEval<CR>', { desc = 'Evaluate Expression' })

-- Open REPL
vim.keymap.set('n', '<leader>dr', ':DapReplToggle<CR>', { desc = 'Toggle Debug REPL' })
