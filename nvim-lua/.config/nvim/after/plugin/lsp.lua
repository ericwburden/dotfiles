local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()


local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  local map = vim.api.nvim_buf_set_keymap

  map(bufnr, 'n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map(bufnr, 'n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(bufnr, 'n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(bufnr, 'n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(bufnr, 'n', '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map(bufnr, 'n', '<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map(bufnr, 'n', '<leader>cc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map(bufnr, 'n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map(bufnr, 'n', '<leader>f',  '<cmd>lua vim.lsp.buf.format(async = true)<CR>', opts)

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

--
---------------------------------------------------------------------------------------
-- Lua LSP Settings -------------------------------------------------------------------
---------------------------------------------------------------------------------------

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

