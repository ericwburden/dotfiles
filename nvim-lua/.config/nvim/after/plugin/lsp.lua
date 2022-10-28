local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")

  buf_map(bufnr, 'n', '<silent>gd', ':LspDef<CR>', opts)
  buf_map(bufnr, 'n', '<silent>K',  ':LspHover<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gD', ':LspImplementation<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gh', ':LspSignatureHelp<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gT', ':LspTypeDef<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gr', ':LspRefs<CR>', opts)
  buf_map(bufnr, 'n', '<silent>g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map(bufnr, 'n', '<silent>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_map(bufnr, 'n', '<silent>g[', ':LspDiagPrev<CR>', opts)
  buf_map(bufnr, 'n', '<silent>g]', ':LspDiagNext<CR>', opts)
  buf_map(bufnr, 'n', '<silent>gn', ':LspRename<CR>', opts)

  if client.server_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end


---------------------------------------------------------------------------------------
-- Rust LSP Settings ------------------------------------------------------------------
---------------------------------------------------------------------------------------

require('rust-tools').setup({
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = " =>",
            max_len_align = true,
            max_len_align_padding = 5,
        },
    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                capabilities = capabilities,
                checkOnSave = { command = "clippy" },
                cargo = { loadOutDirsFromCheck = true, },
                procMacro = { enable = true },
            }
        }
    },
})


---------------------------------------------------------------------------------------
-- R LSP Settings ---------------------------------------------------------------------
---------------------------------------------------------------------------------------

lspconfig.r_language_server.setup({on_attach = on_attach})

