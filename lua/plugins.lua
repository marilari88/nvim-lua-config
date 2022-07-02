return require('packer').startup(function()
  -- Packer can manage itself
  --
  use 'wbthomason/packer.nvim'
  use "williamboman/nvim-lsp-installer"
  use { 'neovim/nvim-lspconfig',
    config = function()
      require('plugins/nvim-lspconfig')
    end }

  -- cmp luasnip
  use { 'hrsh7th/nvim-cmp',
    config = function()
      require('plugins/nvim-cmp')
    end }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-buffer'
  use 'onsails/lspkind-nvim'

  use 'p00f/nvim-ts-rainbow'


  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins/nvim-treesitter')
    end,
    run = ':TSUpdate',
  }

  -- null-ls to handle eslint and prettier
  use "jose-elias-alvarez/null-ls.nvim"

  -- colors
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins/telescope')
    end,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',
    config = function()
      require('plugins/nvim-tree')
    end,
  }

  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- git
  use { 'tpope/vim-fugitive' }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins/gitsigns')
    end
  }

  use {
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup { mappings_style = "surround" }
    end
  }

  -- autopairs
  use { "windwp/nvim-autopairs",
    config = function()
      require("plugins.nvim-autopairs")
    end
  }


  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("plugins.lualine")
    end
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest"
    },
    config = function()
      require('plugins.neotest')
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  }

end)
