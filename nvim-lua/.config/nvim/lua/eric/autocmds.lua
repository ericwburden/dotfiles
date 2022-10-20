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
    pattern = { "help", "startuptime", "qf", "lspinfo" },
    command = [[nnoremap <buffer><silent> q :close<CR>]],
    group = exitWithQ,
  })
  api.nvim_create_autocmd("FileType", {
    pattern = "man",
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
    group = exitWithQ,
  })

  -- Set Python tabwidth to 4
  local pythonIndentFix = api.nvim_create_augroup("PythonIndentByFour", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = [[setlocal shiftwidth=4 tabstop=4 expandtab]],
    group = pythonIndentFix,
  })

  -- Exit if NERDTree is the only open window
  local exitSoloNerdTree = api.nvim_create_augroup("ExitSoloNERDTree", { clear = true })
  api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = [[if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
  })

end
