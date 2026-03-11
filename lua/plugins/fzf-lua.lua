return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>p",
			function()
				require("fzf-lua").files()
			end,
			mode = "n",
			desc = "FZF files",
		},
		{ "<leader>r", "<cmd>FzfLua live_grep<cr>", mode = "n", desc = "FZF live grep" },
		{ "<leader>b", "<cmd>FzfLua buffers<cr>", mode = "n", desc = "FZF buffers" },
		{ "<leader>?", "<cmd>FzfLua builtin<cr>", mode = "n", desc = "FZF builtins" },
	},
	config = function()
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
}
