vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight')
	  end
  })

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')

end)
