"   _____      _| |__
"  / _ \ \ /\ / / '_ \	Eric Burden <eric@ericburden.dev>
" |  __/\ V  V /| |_) |	www.ericburden.work
"  \___| \_/\_/ |_.__/	www.github.com/ericwburden
"  
"  NVim Configuration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

" >> Basic Keybindings <<
inoremap <C-j> <Esc>				    " Remap Esc
vnoremap <C-j> <Esc>				    " Remap Esc
inoremap <C-k> <Esc> <bar> :w<CR>		" Save File
nnoremap <C-k> <bar> :w<CR>			    " Save File
inoremap <C-k><C-k> <Esc> <bar> :wq<CR>	" Save and quit
nnoremap <C-k><C-k> <bar> :wq<CR>		" Save and quit

" >> NERDTree Keybindings <<
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader><leader> :NERDTree<CR>

" >> Telescope Keybindings <<
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" >> Rust Tools Keybindings <<
nnoremap <leader>rr :RustRunnables<CR>
nnoremap <leader>rt :RustToggleInlayHints<CR>
nnoremap <leader>rd :RustDebuggables<CR>

" >> LSP bindings <<
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" >> Code navigation shortcuts <<
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> g[    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g]    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" >> Workflow Keybindings <<
nnoremap <leader>ct     :! cargo test -- --nocapture<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cabbr <expr> %% expand('%:p:h')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500		" Keep 500 lines of history in commands, etc.
set noshowmode		" No message on the last line
set signcolumn=yes	" Always show the sign column
set scrolloff=18	" Keep 18 lines above and below the cursor
set number 		    " Use line numbers
set relativenumber	" Use relative line numbers
set smartcase		" Ignore case in search if all lowercase is used
set lazyredraw		" Do not redraw screen while executing commands
set magic		    " Additional special characters in search
set showmatch		" Show matching brackets
set updatetime=600	" Write swapfile to disk after 600 ms no typing
set path+=**        " Searches current directory recursively
set noswapfile      " Disable swap files
set autoread        " Reload files changed outside of Vim

" >> Tabs and Indenting <<
set expandtab		" Replace tabs with spaces
set shiftwidth=4	" Default to 4 spaces
set tabstop=4		" Default to 4 spaces
set colorcolumn=88	" Highlight column 88
set linebreak		" Break at specified character
set textwidth=500	" Maximum width of inserted text
set autoindent		" Use current indent on new lines
set smartindent		" Smart autoindenting for new line

" >> Completion <<
set completeopt=menuone,noinsert,noselect
set omnifunc=v:lua.vim.lsp.omnifunc

" >> Override for specific file types
autocmd FileType yaml           setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType ruby           setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType eruby          setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType vue            setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType html           setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType javascript     setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType typescript     setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType r              setlocal shiftwidth=2 tabstop=2     expandtab

" >> Vim SLIME <<
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.config/nvim/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" >> Markdown Preview <<
let g:mkdp_browser = 'lynx'
let g:mkdp_echo_preview_url = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'nvim-lua/popup.nvim'              " Dependency
    Plug 'nvim-lua/plenary.nvim'            " Dependency
    
    Plug 'itchyny/lightline.vim'            " Lightline
    Plug 'josa42/nvim-lightline-lsp'        " Lightline LSP Integration
    Plug 'altercation/vim-colors-solarized' " Solarized color scheme
    Plug 'shaunsingh/nord.nvim'             " Nord color scheme

    Plug 'jiangmiao/auto-pairs'             " Auto Bracket Pairs
    Plug 'windwp/nvim-ts-autotag'           " Auto closing tags
    Plug 'tpope/vim-commentary'             " Code Commenting Hotkeys

    Plug 'hrsh7th/nvim-cmp'                 " Code Completion
    Plug 'hrsh7th/cmp-nvim-lsp'             " Completion Source: LSP
    Plug 'hrsh7th/cmp-buffer'               " Completion Source: Buffer
    Plug 'hrsh7th/cmp-vsnip'                " Completion Source: vsnip
    Plug 'hrsh7th/vim-vsnip'                " Completion Source: vsnip
    Plug 'jose-elias-alvarez/null-ls.nvim'  " Extra LSP Config

    Plug 'tpope/vim-fugitive'               " Git client/integration
    Plug 'nvim-telescope/telescope.nvim'    " Telescope fuzzy finder
    Plug 'jpalardy/vim-slime'               " Vim SLIME -> Send text to REPL
    Plug 'mechatroner/rainbow_csv'          " Rainbow CSV
    
    Plug 'neovim/nvim-lspconfig'            " LSP Common Configurations
    Plug 'simrat39/rust-tools.nvim'         " LSP Extra Rust Tools
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils' " TS LSP Goodies

    Plug 'preservim/nerdtree'               " NERDTree file explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree Git icons
    Plug 'ryanoasis/vim-devicons'           " NERDTree File type icons

    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts, and Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable           " Enable syntax highlighting
"colorscheme nord        " Use solarized color scheme

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ ,
    \   'right': [ [ 'lineinfo' ],
    \              [ 'lsp_checking', 'lsp_errors', 'lsp_warnings', 'lsp_infos', 'lsp_ok' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ },
    \ 'component_expand': {
    \  'linter_checking': 'lightline#lsp#checking',
    \  'linter_infos': 'lightline#lsp#infos',
    \  'linter_warnings': 'lightline#lsp#warnings',
    \  'linter_errors': 'lightline#lsp#errors',
    \  'linter_ok': 'lightline#lsp#ok',
    \ },
    \ 'component_type': {
    \     'linter_checking': 'right',
    \     'linter_infos': 'right',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'right',
    \ }
\ }
let g:lightline#lsp#indicator_checking = "⥁"
let g:lightline#lsp#indicator_infos = "ℹ"
let g:lightline#lsp#indicator_warnings = "⚠"
let g:lightline#lsp#indicator_errors = "✘"
let g:lightline#lsp#indicator_ok = "✔"
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" >> Additional Colors <<
hi LspDiagnosticsVirtualTextError guifg=red gui=bold,italic,underline ctermfg=167:
hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline ctermfg=179
hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline ctermfg=195
hi LspDiagnosticsVirtualTextHint guifg=green gui=bold,italic,underline ctermfg=194


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require'lspconfig'
local null_ls = require("null-ls")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

null_ls.setup({
    sources = {
        -- Use ESLint and Prettier in TS files
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier
    },
    on_attach = on_attach
})

-- Vue LSP Setup
nvim_lsp.vuels.setup{}

-- Python LSP Setup
nvim_lsp.pyright.setup{}

-- R LSP Setup
nvim_lsp.r_language_server.setup{}

-- Elm LSP Setup
nvim_lsp.elmls.setup{}

-- Julia LSP Setup
nvim_lsp.julials.setup{}

-- TypeScript LSP Setup
nvim_lsp.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})

-- Rust LSP Setup
local rust_opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = " =>",
            max_len_align = true,
            max_len_align_padding = 5,
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                capabilities = capabilities,
                checkOnSave = { command = "clippy" },
                cargo = { loadOutDirsFromCheck = true, },
                procMacro = { enable = true },
            }
        }
    },
}

require('rust-tools').setup(rust_opts)

EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Treesitter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true, },
  indent = { enable = true },
  autotag = { enable = true }
}

EOF


