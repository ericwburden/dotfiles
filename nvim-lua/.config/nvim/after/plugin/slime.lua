vim.g.slime_target = "tmux"
vim.g.slime_paste_file = os.getenv("HOME") .. "/.config/vim-slime/.slime_paste"
vim.g.slime_default_config = { ["socket_name"] = "default", ["target_pane"] = "{last}" }
