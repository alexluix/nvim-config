require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls"
  }
})

local on_attach = function(_, _)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("elixir").setup({
  on_attach = on_attach,
  capabilities = capabilities,
  nextls = {enable = false},
  credo = {enable = true},
  elixirls = {enable = true},
})
