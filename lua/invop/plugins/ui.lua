require('vim._core.ui2').enable()
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
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>")
require('lualine').setup()
require('nvim-treesitter').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
