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
  use 'mfussenegger/nvim-dap'         -- DAP for Rust
  use 'neovim/nvim-lspconfig'         -- LSP Common Configurations
  use 'nvim-lualine/lualine.nvim'     -- Status line
  use 'nvim-telescope/telescope.nvim' -- Telescope fuzzy finder
  use 'preservim/nerdtree'            -- NERDTree file explorer
  use 'ryanoasis/vim-devicons'        -- NERDTree file type icons
  use 'simrat39/rust-tools.nvim'      -- LSP Extra Rust Tools
  use 'tpope/vim-commentary'          -- Code commenting hotkeys
  use 'tpope/vim-fugitive'            -- Git client integration
  use 'windwp/nvim-ts-autotag'        -- Auto closing tags
  use 'Xuyuanp/nerdtree-git-plugin'   -- NERDTree Git icons

  -- Code Completion Plugins
  use 'hrsh7th/nvim-cmp'              -- Code Completion
  use 'hrsh7th/cmp-nvim-lsp'          -- Completion Source: LSP
  use 'hrsh7th/cmp-buffer'            -- Completion Source: Buffer
  use 'hrsh7th/cmp-vsnip'             -- Completion Source: vsnip
  use 'hrsh7th/vim-vsnip'             -- Completion Source: vsnip

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


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

