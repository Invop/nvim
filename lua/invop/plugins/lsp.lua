vim.diagnostic.config({
  severity_sort = true,
  signs = true,
  virtual_text = true,
})

require("lazydev").setup({
  library = { { path = "luvit-meta/library", words = { "vim%.uv" } } },
})

require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config['lua_ls'] = {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
    }
  }
}

vim.lsp.config['tailwindcss'] = {
  capabilities = capabilities,
  filetypes = {
    "html", "css", "scss", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "vue", "svelte", "heex", "htmlangular"
  },
}
vim.lsp.config['angularls'] = {
  capabilities = capabilities,
  filetypes = { 'typescript', 'html', 'typescriptreact', 'htmlangular' },
}
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "vtsls", "tailwindcss", "angularls" },
  handlers = {
    function(server)
      if not vim.lsp.config[server] then
        vim.lsp.config[server] = { capabilities = capabilities }
      end
      vim.lsp.enable(server)
    end,
  }
})

require('roslyn').setup({ capabilities = capabilities })
