require("nvim-tree").setup({
  sort_by = "case_sensitive",
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "l", action = "edit_no_picker" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

vim.api.nvim_set_keymap('n', '<Leader>n', '<cmd>NvimTreeFindFileToggle<CR>', { noremap = true })
