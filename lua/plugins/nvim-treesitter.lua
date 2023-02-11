return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/playground",
	},
	config = function()
		require("ts_context_commentstring.internal").update_commentstring({
			key = "__multiline",
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "typescript", "javascript", "tsx" },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					-- scope_incremental = "<C-s>",
					node_decremental = "grm",
				},
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
		})
	end,
}
