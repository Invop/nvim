local plugins = {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/Bilal2453/luvit-meta" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/seblyng/roslyn.nvim" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
  { src = "https://github.com/nvim-neotest/neotest" },
  { src = "https://github.com/nsidorenco/neotest-vstest" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/folke/trouble.nvim"},
}

vim.pack.add(plugins)
