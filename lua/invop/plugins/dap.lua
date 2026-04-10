local dap = require('dap')
local path_parts = { vim.fn.stdpath("data"), "mason", "packages", "netcoredbg" }

if vim.g.is_windows then
  table.insert(path_parts, "netcoredbg")
  table.insert(path_parts, "netcoredbg.exe")
else
  table.insert(path_parts, "netcoredbg")
end

local final_path = vim.fn.expand(vim.fs.joinpath(unpack(path_parts)))

local netcoredbg_adapter = {
  type = "executable",
  command = final_path,
  args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter
dap.adapters.coreclr = netcoredbg_adapter

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "LAUNCH directly from nvim",
    request = "launch",
    program = function()
      return require("dap-dll-autopicker").build_dll_path()
    end
  },
}

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
