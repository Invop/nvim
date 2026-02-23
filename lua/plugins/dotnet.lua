return {
  -- Roslyn.nvim configuration
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "vb" },
    opts = {
      filewatching = "auto",
      broad_search = false,
      lock_target = false,
    },
    config = function(_, opts)
      require("roslyn").setup(opts)

      -- Server-specific settings for C#
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
        },
      })
    end,
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp" } },
  },

  -- Formatting via Conform
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
    },
  },

  -- Debugging with Netcoredbg
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      if not dap.adapters["netcoredbg"] then
        dap.adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg"),
          args = { "--interpreter=vscode" },
        }
      end

      for _, lang in ipairs({ "cs", "vb" }) do
        dap.configurations[lang] = dap.configurations[lang]
          or {
            {
              type = "netcoredbg",
              name = "Launch file",
              request = "launch",
              program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
            },
          }
      end
    end,
  },

  -- Testing with vstest
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {"Issafalcon/neotest-dotnet" ,"nsidorenco/neotest-vstest" },
    opts = {
   },
  },

-- External Tools (Mason)
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "csharpier",
          "netcoredbg",
          -- "roslyn",     
		},
      })
      require("mason-lspconfig").setup({
          ensure_installed = { "roslyn" }
      })
    end,
  },
}
