require("neotest").setup({ adapters = { require("neotest-vstest") } })
local neotest = require("neotest")

vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>tv", function() neotest.summary.toggle() end)
vim.keymap.set("n", "<leader>ts", function() neotest.run.run({ suite = true }) end)
vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end)
