-- 0
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
})

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

--5
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
      preset = 'none', 
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },
    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },
    sources = { default = { "lsp" } }
})

--6
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter').setup()

--7
vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
})

local dap = require('dap')


-- Define the base path parts
local path_parts = { vim.fn.stdpath("data"), "mason", "packages", "netcoredbg" }

-- Adjust path based on OS
if vim.g.is_windows then
    -- Windows structure: netcoredbg/netcoredbg/netcoredbg.exe
    table.insert(path_parts, "netcoredbg")
    table.insert(path_parts, "netcoredbg.exe")
else
    -- Linux/macOS structure: netcoredbg/netcoredbg
    table.insert(path_parts, "netcoredbg")
end

local mason_path = vim.fs.joinpath(unpack(path_parts))

-- Security: Use absolute path expansion for 0.11 compliance
local final_path = vim.fn.expand(mason_path)

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
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue/Start" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
vim.keymap.set("n", "<F8>", dap.step_out, { desc = "DAP: Step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: REPL open" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run last" })
--8
vim.pack.add({
    { src = "https://github.com/nvim-neotest/nvim-nio" },
})
vim.pack.add({
    { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
})
vim.pack.add({
    { src = "https://github.com/nvim-neotest/neotest" },
})
vim.pack.add({
    { src = "https://github.com/nsidorenco/neotest-vstest" },
})
require("neotest").setup({
  adapters = {
    require("neotest-vstest")
  }
})
local neotest = require("neotest")

vim.keymap.set("n", "<leader>tr", function()
    neotest.run.run()
end, { desc = "Test: Run Nearest" })

vim.keymap.set("n", "<leader>tv", function()
    neotest.summary.toggle()
end, { desc = "Test: Toggle Summary" })

vim.keymap.set("n", "<leader>ts", function()
    neotest.run.run({ suite = true })
end, { desc = "Test: Run Suite" })

vim.keymap.set("n", "<leader>td", function()
    neotest.run.run({ strategy = "dap" })
end, { desc = "Test: Debug Nearest" })

vim.keymap.set("n", "<leader>to", function()
    neotest.output.open({ enter = true })
end, { desc = "Test: Open Output" })

vim.keymap.set("n", "<leader>ta", function()
    neotest.run.run(vim.uv.cwd())
end, { desc = "Test: Run All in Project" })

vim.keymap.set("n", "<leader>tS", function()
    neotest.run.stop()
end, { desc = "Test: Stop Execution" })


--9
vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

