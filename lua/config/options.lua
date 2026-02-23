vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.snacks_animate = false

local opt =vim.opt
opt.shell = "pwsh.exe -NoLogo"
opt.shellcmdflag = "-ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding"
  .. "=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';"
  .. "$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
opt.shellredir = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
opt.shellpipe = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard

opt.guicursor = "i:block"

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.colorcolumn = "80"
opt.background ="dark"
