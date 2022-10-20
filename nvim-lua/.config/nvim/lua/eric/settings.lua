vim.g.mapleader = ' '                 -- Map leader key to <space>

vim.opt.syntax = 'enable'             -- Enable syntax highlighting
vim.opt.wrap = false                  -- Disable word wrap
vim.opt.history = 500	              	-- Keep 500 lines of history in commands, etc.
vim.opt.showmode = false            	-- No message on the last line
vim.opt.signcolumn = "yes"          	-- Always show the sign column
vim.opt.scrolloff = 18	            	-- Keep 18 lines above and below the cursor
vim.opt.number = true	              	-- Use line numbers
vim.opt.relativenumber = true	      	-- Use relative line numbers
vim.opt.smartcase = true            	-- Ignore case in search if all lowercase is used
vim.opt.lazyredraw = true           	-- Do not redraw screen while executing commands
vim.opt.magic = true	              	-- Additional special characters in search
vim.opt.showmatch = true            	-- Show matching brackets
vim.opt.updatetime = 600            	-- Write swapfile to disk after 600 ms no typing
vim.opt.path = vim.opt.path + "**"  	-- Searches current directory recursively
vim.opt.swapfile = false            	-- Disable swap files
vim.opt.autoread = true             	-- Reload files changed outside of Vim
vim.opt.hlsearch = false            	-- Disable search highlights
vim.opt.incsearch = true            	-- Highlight matches as you type
vim.opt.expandtab = true  	          -- Replace tabs with spaces
vim.opt.shiftwidth = 2    	          -- Default to 2 spaces
vim.opt.tabstop = 2       	          -- Default to 2 spaces
vim.opt.colorcolumn = "88" 	          -- Highlight column 88
vim.opt.linebreak = true  	          -- Break at specified character
vim.opt.textwidth = 500	  	          -- Maximum width of inserted text
vim.opt.autoindent = true 	          -- Use current indent on new lines
vim.opt.smartindent = true	          -- Smart autoindenting for new line
vim.opt.cursorline = true           	-- Highlight the line with the cursor

-- Autocomplete options
vim.opt.completeopt = {"menuone","noinsert","noselect"}
