require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"typescript-language-server", "eslint-lsp"},  -- Correct package names
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript setup
require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  -- Disable tsserver formatting if you use ESLint/null-ls for formatting
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end
})

-- ESLint setup
require('lspconfig').eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end
})
