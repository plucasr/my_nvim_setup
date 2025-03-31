local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

local capabilities = cmp.default_capabilities()

local on_attach = function(client, bufnr)
  -- Common keymaps and LSP handlers here
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  -- Add other common keymaps...
end

-- TypeScript setup (using the new typescript-tools instead of tsserver)
require('typescript-tools').setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
    }
  }
})

-- ESLint setup
lsp.eslint.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

-- Other LSP servers...
