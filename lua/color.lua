vim.g.tokyonight_style = "storm"
vim.g.italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme dracula]]
