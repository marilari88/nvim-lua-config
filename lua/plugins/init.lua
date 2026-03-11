return {
	"nvim-lua/plenary.nvim",
	"HiPhish/nvim-ts-rainbow2",
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>c",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
					tailwind_opts = {
						update_names = true,
					},
				},
			})
		end,
	},
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	"morhetz/gruvbox",
	{
		"marilari88/twoslash-queries.nvim",
		config = function()
			require("twoslash-queries").setup({
				multi_line = true, -- print types in multi line mode
				is_enabled = true, -- keep disabled at startup and enable it on request with the EnableTwoslashQueries command
				highlight = "Substitute",
			})
		end,
	},
	"tpope/vim-fugitive",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	"christoomey/vim-tmux-navigator",
	{ "kyazdani42/nvim-web-devicons" },
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {
			bookmark_0 = {
				sign = "⚑",
				annotate = true,
			},
		},
	},
}
