require("yazi").setup({
  open_for_directories = true,
  floating_window_scaling_factor = 0.9,
  yazi_floating_window_border = "rounded",
  keymaps = {
    copy_relative_path_to_selected_files = vim.g.is_windows and false or "<c-y>",
    change_working_directory = "<c-d>",
  },
})

vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>")
vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>")