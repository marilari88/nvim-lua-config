return {
	"nvim-lua/plenary.nvim",
	"L3MON4D3/LuaSnip",
	"p00f/nvim-ts-rainbow",
	"rcarriga/nvim-notify",
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	"jose-elias-alvarez/null-ls.nvim",
	"sainnhe/everforest",
	"folke/tokyonight.nvim",
	"morhetz/gruvbox",
	"Mofiqul/dracula.nvim",
	"kyazdani42/nvim-web-devicons",
	{
		"marilari88/twoslash-queries.nvim",
		config = function()
			require("twoslash-queries").setup({
				multi_line = true, -- print types in multi line mode
				is_enabled = true, -- keep disabled at startup and enable it on request with the EnableTwoslashQueries command
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"tpope/vim-fugitive",
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	"antoinemadec/FixCursorHold.nvim",
	"haydenmeade/neotest-jest",
	"marilari88/neotest-vitest",
	"nvim-neotest/neotest-plenary",
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
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>s", "<cmd>AerialToggle!<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>[", "<cmd>AerialPrev<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>]", "<cmd>AerialNext<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
				end,
			})
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			vim.o.sessionoptions = "curdir,folds,tabpages,winsize,winpos,terminal"
			require("auto-session").setup({
				log_level = "error",
			})
		end,
	},
	{
		"rmagatti/session-lens",
		config = function()
			require("session-lens").setup({
				prompt_title = "Sessions",
			})
		end,
	},
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({})
		end,
	},
	"stevearc/dressing.nvim",
}
