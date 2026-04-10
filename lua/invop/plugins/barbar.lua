vim.g.barbar_auto_setup = false

require("barbar").setup({
  animation = true,
  tabpages = true,
  clickable = true,
  icons = {
    buffer_index = false,
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '✘' },
      [vim.diagnostic.severity.WARN]  = { enabled = true, icon = '▲' },
      [vim.diagnostic.severity.HINT]  = { enabled = false },
      [vim.diagnostic.severity.INFO]  = { enabled = false },
    },
    filetype = { enabled = true },
    modified = { button = '●' },
    pinned = { button = '', filename = true },
  },
  focus_on_close = 'left',
  semantic_letters = true,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)