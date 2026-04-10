local sev = vim.diagnostic.severity
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [sev.ERROR] = '✘',
      [sev.WARN]  = '▲',
      [sev.HINT]  = '⚑',
      [sev.INFO]  = '»',
    },
  },
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

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "vtsls", "tailwindcss" },
  handlers = {
    function(server)
      vim.lsp.config[server] = { capabilities = capabilities }
      vim.lsp.enable(server)
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          }
        }
      })
    end,

    ["tailwindcss"] = function()
      require("lspconfig").tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { 
          "html", "css", "scss", "javascript", "javascriptreact", 
          "typescript", "typescriptreact", "vue", "svelte", "heex" 
        },
      })
    end
  }
})

require('roslyn').setup({ capabilities = capabilities })
