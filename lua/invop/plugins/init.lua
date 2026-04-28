vim.pack.add({
  -- Core
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- Lua dev
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/Bilal2453/luvit-meta" },

  -- UI
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/romgrk/barbar.nvim" },

  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/seblyng/roslyn.nvim" },

  -- Completion
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },

  -- Debug & Testing
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
  { src = "https://github.com/nvim-neotest/neotest" },
  { src = "https://github.com/nsidorenco/neotest-vstest" },

  -- Fuzzy Finder
  { src = "https://github.com/nvim-telescope/telescope.nvim" },

  -- Helpers
  { src = "https://github.com/folke/which-key.nvim" },

  --Yazi
  { src = "https://github.com/mikavilpas/yazi.nvim" },
})

require("invop.plugins.ui")
require("invop.plugins.trouble")
require("invop.plugins.lsp")
require("invop.plugins.completion")
require("invop.plugins.treesitter")
require("invop.plugins.debug")
require("invop.plugins.telescope")
require("invop.plugins.whichkey")
require("invop.plugins.yazi")
require("invop.plugins.barbar")
