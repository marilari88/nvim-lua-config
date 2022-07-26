require("git-worktree").setup({})

require("telescope").load_extension("git_worktree")

local map = require("keybindings")

vim.cmd([[
command! WorktreeList lua require('telescope').extensions.git_worktree.git_worktrees()
command! WorktreeAdd lua require('telescope').extensions.git_worktree.create_git_worktree()
]])

map("n", "<leader>e", "<cmd>WorktreeList<cr>")
map("n", "<leader>ea", "<cmd>WorktreeAdd<cr>")
