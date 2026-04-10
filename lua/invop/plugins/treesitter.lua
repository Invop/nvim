-- Core setup (install_dir is optional, shown here for clarity)
require("nvim-treesitter").setup({
  -- install_dir = vim.fn.stdpath('data') .. '/site',
})

-- Install parsers (no-op if already installed)
require("nvim-treesitter").install({
  "vimdoc",
  "javascript",
  "typescript",
  "c",
  "lua",
  "rust",
  "jsdoc",
  "bash",
  "c_sharp"
})

-- Enable treesitter features per filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "c", "lua", "rust", "jsdoc", "bash" },
  callback = function(ev)
    local buf = ev.buf

    -- Skip large files (>100KB)
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > 100 * 1024 then
      vim.notify(
        "File larger than 100KB, treesitter disabled for performance",
        vim.log.levels.WARN,
        { title = "Treesitter" }
      )
      return
    end

    -- Highlighting (built into Neovim)
    vim.treesitter.start()

    -- Folds (built into Neovim)
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"

    -- Indentation (provided by nvim-treesitter, experimental)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Markdown: also noted in 0.12 news — treesitter highlighting is now
-- enabled for Markdown by default in Neovim, so this just ensures folds/indent too
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.treesitter.start()
    vim.bo.syntax = "on" -- keep vim regex highlighting alongside treesitter
  end,
})

-- treesitter-context
require("treesitter-context").setup({
  enable = true,
  multiwindow = false,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "cursor",
  separator = nil,
  zindex = 20,
  on_attach = nil,
})
