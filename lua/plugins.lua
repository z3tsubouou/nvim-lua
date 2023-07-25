-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' } -- packer manager
  use { 'neovim/nvim-lspconfig' }  -- LSP
  use { 'onsails/lspkind-nvim' }   -- vscode-like pictograms
  use { 'hrsh7th/cmp-buffer' }     -- nvim-cmp source for buffer words
  use { 'hrsh7th/cmp-nvim-lsp' }   -- nvim-cmp source for neovim's built-in LSP
  use { 'glepnir/lspsaga.nvim' }   -- LSP UIs
  use { 'hrsh7th/nvim-cmp' }       -- Completion
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'windwp/nvim-autopairs' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'numToStr/Comment.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'dinhhuy258/git.nvim' }
  use { 'williamboman/mason.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'mfussenegger/nvim-lint' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  use {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  }
  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
end)
