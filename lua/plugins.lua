return require('packer').startup(function()
  -- Packer can manage itself
  --
  use 'wbthomason/packer.nvim'
  use "williamboman/nvim-lsp-installer"
  use 'neovim/nvim-lspconfig'

  -- cmp luasnip
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-buffer'
  use 'onsails/lspkind-nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }


  -- colors
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
end)
