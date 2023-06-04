if vim.fn.has "nvim-0.7" then
  local api = vim.api

  -- Highlight on yank
  local yankGroup = api.nvim_create_augroup("YankHighlight", { clear = true })
  api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGroup,
  })

  -- Exit certain windows with "q"
  local exitWithQ = api.nvim_create_augroup("ExitWindowsWithQ", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = { "help", "startuptime", "qf", "lspinfo", "nerdtree" },
    command = [[nnoremap <buffer><silent> q :close<CR>]],
    group = exitWithQ,
  })
  api.nvim_create_autocmd("FileType", {
    pattern = "man",
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
    group = exitWithQ,
  })

  -- Set Python and Rust tabwidth to 4
  local indentByFour = api.nvim_create_augroup("indentByFour", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = { "python", "rust" },
    command = [[setlocal shiftwidth=4 tabstop=4 expandtab]],
    group = indentByFour,
  })

  -- Default Nord comments are too dark, brighten them up a bit
  local nordThemeOverrides = api.nvim_create_augroup("NordThemeOverrides", { clear = true })
  api.nvim_create_autocmd("ColorScheme", {
    pattern = "nord",
    command = [[highlight Comment ctermfg=13 guifg=#D8DEE9]],
    group = nordThemeOverrides,
  })

  -- Exit if nvim-tree is the only open window after closing other windows
  local NvimTreeClose = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true})
  api.nvim_create_autocmd("BufEnter", {
    pattern = "NvimTree_*",
    callback = function()
      local layout = vim.api.nvim_call_function("winlayout", {})
      if layout[1] ~= "leaf" then return end
      if layout[2] == nil then return end
      if layout[3] ~= nil then return end
      local buf = vim.api.nvim_win_get_buf(layout[2])
      local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
      if filetype == "NvimTree" then
        vim.cmd("confirm quit")
      end
    end,
    group = NvimTreeClose,
  })

  -- Set keybindings specific to NERDTree
  local nerdTreeKeyBindings = api.nvim_create_augroup("NERDTreeKeyBindings", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = "nerdtree",
    command = [[nnoremap <buffer><leader><leader> q :quit<CR>]],
    group = nerdTreeKeyBindings,
  })

  -- Detect *.pl files as Prolog files
  local detectPrologFiles = api.nvim_create_augroup("DetectPrologFiles", { clear = true })
  api.nvim_create_autocmd("BufRead", {
    pattern = "*.pl",
    command = [[set filetype=prolog]],
    group = detectPrologFiles,
  })

end


