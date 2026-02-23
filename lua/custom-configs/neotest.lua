require("neotest").setup({

  log_level = vim.log.levels.DEBUG,
  adapters = {
    require("neotest-vstest")
  }
})
