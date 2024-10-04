-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use( 'nvim-treesitter/playground' )
  use( 'ThePrimeagen/harpoon' )
  use( 'mbbill/undotree' )
  use( 'wakatime/vim-wakatime' )
  use( 'tpope/vim-fugitive' )
  use( 'ThePrimeagen/vim-be-good' )

  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',

      -- Snippets
      {'L3MON4D3/LuaSnip', tag = "v2.*", run = "make install_jsregexp"}
    },
  }
end)

