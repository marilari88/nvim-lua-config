return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/playground",
		"windwp/nvim-ts-autotag",
		"HiPhish/rainbow-delimiters.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
			languages = {
				typescript = { __default = "// %s", __multiline = "/* %s */" },
			},
		})
		vim.g.skip_ts_context_commentstring_module = true

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "typescript", "javascript", "tsx", "json", "http" },
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

		require("nvim-ts-autotag").setup()

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
