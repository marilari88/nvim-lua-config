return {
	"nvim-lua/plenary.nvim",
	"L3MON4D3/LuaSnip",
	"HiPhish/nvim-ts-rainbow2",
	"rcarriga/nvim-notify",
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	--[[ { ]]
	--[[ 	"windwp/nvim-ts-autotag", ]]
	--[[ 	config = function() ]]
	--[[ 		require("nvim-ts-autotag").setup() ]]
	--[[ 	end, ]]
	--[[ }, ]]
	"jose-elias-alvarez/null-ls.nvim",
	"sainnhe/everforest",
	{
		"folke/tokyonight.nvim",
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true },
			variables = { italic = true },
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	"morhetz/gruvbox",
	"Mofiqul/dracula.nvim",
	"kyazdani42/nvim-web-devicons",
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
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({})
		end,
	},
	"stevearc/dressing.nvim",
	"mg979/vim-visual-multi",
	"christoomey/vim-tmux-navigator",
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
