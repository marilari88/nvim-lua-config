return require("packer").startup(function()
	-- Packer can manage itself
	--
	use("wbthomason/packer.nvim")

	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugins/mason")
		end,
	})

  use("marilari88/twoslash-queries.nvim")

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/nvim-lspconfig")
		end,
	})

	-- cmp luasnip
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins/nvim-cmp")
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("onsails/lspkind-nvim")

	use("p00f/nvim-ts-rainbow")

	use("rcarriga/nvim-notify")

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins/nvim-treesitter")
		end,
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- null-ls to handle eslint and prettier
	use("jose-elias-alvarez/null-ls.nvim")

	-- colors
	use("sainnhe/everforest")
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
	use("Mofiqul/dracula.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/telescope")
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly",
		config = function()
			require("plugins/nvim-tree")
		end,
	})

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- git
	use({ "tpope/vim-fugitive" })

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns")
		end,
	})

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.nvim-autopairs")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-plenary",
		},
		config = function()
			require("plugins.neotest")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
	})

	use({
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("plugins.git-worktree")
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	use({
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
	})

	use({
		"rmagatti/auto-session",
		config = function()
			--[[ vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" ]]
			vim.o.sessionoptions = "curdir,folds,tabpages,winsize,winpos,terminal"
			require("auto-session").setup({
				log_level = "error",
			})
		end,
	})

	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({
				prompt_title = "Sessions",
			})
		end,
	})

	use({
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({})
		end,
	})
end)
