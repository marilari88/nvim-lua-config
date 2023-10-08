return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/playground",
		"HiPhish/rainbow-delimiters.nvim",
	},
	config = function()
		require("ts_context_commentstring.internal").update_commentstring({
			key = "__multiline",
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "typescript", "javascript", "tsx", "json", "http" },
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
		})

		local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				commonlisp = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
			blacklist = { "c", "cpp" },
		}
	end,
}
