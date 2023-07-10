-- Installs packer if it isn't already installed.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'        -- Packer can manage itself

  use 'nvim-lua/popup.nvim'           -- Dependency for other plugins
  use 'nvim-lua/plenary.nvim'         -- Dependency for other plugins

  use 'arcticicestudio/nord-vim'      -- Nord colorscheme
  use 'jiangmiao/auto-pairs'          -- Auto bracket pairs
  use 'jpalardy/vim-slime'            -- Vim SLIME -> Send text to REPL
  use 'nvim-lualine/lualine.nvim'     -- Status line
  use 'nvim-telescope/telescope.nvim' -- Telescope fuzzy finder
  use 'tpope/vim-commentary'          -- Code commenting hotkeys
  use 'tpope/vim-fugitive'            -- Git client integration
  use 'windwp/nvim-ts-autotag'        -- Auto closing tags
  use 'Xuyuanp/nerdtree-git-plugin'   -- NERDTree Git icons

  -- LSP Plugins and setup
  use "williamboman/mason.nvim"       -- LSP Installer GUI
  use 'mfussenegger/nvim-dap'         -- Debug Adapter Protocol
  use 'neovim/nvim-lspconfig'         -- LSP Common Configurations
  use 'simrat39/rust-tools.nvim'      -- LSP Extra Rust Tools

  -- File Explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Code Completion Plugins
  use 'hrsh7th/nvim-cmp'              -- Code Completion
  use 'hrsh7th/cmp-nvim-lsp'          -- Completion Source: LSP
  use 'hrsh7th/cmp-buffer'            -- Completion Source: Buffer
  use 'hrsh7th/cmp-vsnip'             -- Completion Source: vsnip
  use 'hrsh7th/vim-vsnip'             -- Completion Source: vsnip
  use "rafamadriz/friendly-snippets"  -- Community snippets

  -- Tabnine completion
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }

  -- Treesitter syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Use telescope as the default picker
  use 'nvim-telescope/telescope-ui-select.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

