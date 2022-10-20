local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- >> Basic Keybindings <<
map('i', '<C-j>',      '<Esc>', opts)				    -- Remap Esc
map('v', '<C-j>',      '<Esc>', opts)				    -- Remap Esc
map('n', '<leader>sf', '<bar> :w<CR>', opts)		-- Save File
map('n', '<leader>sq', '<bar> :wq<CR>', opts)		-- Save and quit
map('n', '<leader>qq', '<bar> :q!<CR>', opts)		-- Quit without saving

-- >> NERDTree Keybindings <<
map('n', '<leader>nf', ':NERDTreeFocus<CR>', opts)
map('n', '<leader>nt', ':NERDTreeToggle<CR>', opts)
map('n', '<leader><leader>', ':NERDTree<CR>', opts)

-- >> Telescope Keybindings <<
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)

-- >> Rust Tools Keybindings <<
map('n', '<leader>rr', ':RustRunnables<CR>', opts)
map('n', '<leader>rt', ':RustToggleInlayHints<CR>', opts)
map('n', '<leader>rd', ':RustDebuggables<CR>', opts)
map('n', '<leader>ha', ':RustHoverActions<CR>', opts)

-- >> Code navigation shortcuts <<
-- Mappings in after/plugin/lsp.lua
    
-- >> Workflow Keybindings <<
map('n', '<leader>ct', ':! cargo test -- --nocapture<CR>', opts)
