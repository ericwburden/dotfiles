local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- >> Basic Keybindings <<
map('i', '<C-j>',      '<Esc>', opts)				    -- Remap Esc
map('v', '<C-j>',      '<Esc>', opts)				    -- Remap Esc
map('n', '<leader>sf', '<bar> :w<CR>', opts)		-- Save File
map('n', '<leader>sq', '<bar> :wq<CR>', opts)		-- Save and quit
map('n', '<leader>qq', '<bar> :q!<CR>', opts)		-- Quit without saving

-- >> NVim Tree Keybindings <<
map('n', '<leader>nf', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>nt', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader><leader>', ':NvimTreeToggle<CR>', opts)

-- >> Telescope Keybindings <<
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', opts)

-- >> Rust Tools Keybindings <<
map('n', '<leader>rr', ':RustRunnables<CR>', opts)
map('n', '<leader>rt', ':RustToggleInlayHints<CR>', opts)
map('n', '<leader>rd', ':RustDebuggables<CR>', opts)
map('n', '<leader>ha', ':RustHoverActions<CR>', opts)

-- >> LSP Keybindings <<
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d',       '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d',       '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- >> Workflow Keybindings <<
map('n', '<leader>ct', ':! cargo test -- --nocapture<CR>', opts)
