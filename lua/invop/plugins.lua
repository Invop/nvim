-- 1
vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

-- 2
vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

-- 3
vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup()


-- 4
vim.pack.add({
    { src = "https://github.com/seblyng/roslyn.nvim" },
})

require('roslyn').setup()

