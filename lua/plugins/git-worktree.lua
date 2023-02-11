local map = require("keybindings")

return {
	"ThePrimeagen/git-worktree.nvim",
	config = function()
		require("git-worktree").setup()

		vim.cmd([[
command! WorktreeList lua require('telescope').extensions.git_worktree.git_worktrees()
command! WorktreeAdd lua require('telescope').extensions.git_worktree.create_git_worktree()
]])

		map("n", "<leader>e", "<cmd>WorktreeList<cr>")
		map("n", "<leader>ea", "<cmd>WorktreeAdd<cr>")
		require("telescope").load_extension("git_worktree")
	end,
}
