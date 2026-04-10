require('vim._core.ui2').enable({})

require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = { strings = true, emphasis = true, comments = true, folds = true },
  strikethrough = true,
  inverse = true,
})
vim.cmd("colorscheme gruvbox")

require('lualine').setup()

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>")