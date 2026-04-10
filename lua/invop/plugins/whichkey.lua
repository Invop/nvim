local wk = require("which-key")

wk.setup({
  preset = "modern",
  delay = 200,
})
wk.add({
  { "<leader>f",  group = "find (telescope)" },
  { "<leader>ff", desc = "files" },
  { "<leader>fg", desc = "grep" },
  { "<leader>fb", desc = "buffers" },
  { "<leader>fh", desc = "help tags" },

  { "<leader>t",  group = "test" },
  { "<leader>tr", desc = "run nearest" },
  { "<leader>tv", desc = "toggle summary" },
  { "<leader>ts", desc = "run suite" },
  { "<leader>td", desc = "run with dap" },

  { "<leader>u",  desc = "undo tree" },
  { "<leader>e",  desc = "explorer" },
  
  { "<F5>",  desc = "dap: continue" },
  { "<F9>",  desc = "dap: breakpoint" },
  { "<F10>", desc = "dap: step over" },
  { "<F11>", desc = "dap: step into" },
})