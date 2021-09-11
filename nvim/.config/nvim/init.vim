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

" >> Tabs and Indenting <<
set expandtab		" Replace tabs with spaces
set shiftwidth=4	" Default to 4 spaces
set tabstop=4		" Default to 4 spaces
set colorcolumn=88	" Highlight column 88
set linebreak		" Break at specified character
set textwidth=500	" Maximum width of inserted text
set autoindent		" Use current indent on new lines
set smartindent		" Smart autoindenting for new line
set completeopt=menuone,noinsert,noselect

" Override for specific file types
autocmd FileType yaml           setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType ruby           setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType eruby          setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType vue            setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType html           setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType javascript     setlocal shiftwidth=2 tabstop=2     expandtab
autocmd FileType typescript     setlocal shiftwidth=2 tabstop=2     expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'nvim-lua/popup.nvim'              " Dependency
    Plug 'nvim-lua/plenary.nvim'            " Dependency

    Plug 'jiangmiao/auto-pairs'             " Auto Bracket Pairs
    Plug 'windwp/nvim-ts-autotag'           " Auto closing tags
    Plug 'tpope/vim-fugitive'               " Git client/integration
    Plug 'itchyny/lightline.vim'            " Lightline
    Plug 'josa42/nvim-lightline-lsp'        " Lightline LSP Integration
    Plug 'neovim/nvim-lspconfig'            " LSP Common Configurations
    Plug 'nvim-lua/completion-nvim'         " LSP Code Completion
    Plug 'simrat39/rust-tools.nvim'         " LSP Extra Rust Tools
    Plug 'preservim/nerdtree'               " NERDTree file explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree Git icons
    Plug 'ryanoasis/vim-devicons'           " NERDTree File type icons
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
    Plug 'nvim-treesitter/completion-treesitter'    " Treesitter code completion source
    Plug 'altercation/vim-colors-solarized' " Solarized color scheme
    Plug 'nvim-telescope/telescope.nvim'    " Telescope fuzzy finder
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts, and Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable           " Enable syntax highlighting
colorscheme solarized   " Use solarized color scheme

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

" >> Additional Error Colors <<
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
local nvim_lsp = require'lspconfig'
local on_attach = require'completion'.on_attach

-- Vue LSP Setup
nvim_lsp.vuels.setup{on_attach=on_attach}

-- Python LSP Setup
nvim_lsp.pyright.setup{on_attach=on_attach}

-- Rust LSP Setup
nvim_lsp.rust_analyzer.setup{on_attach=on_attach}
local opts = {
    tools = { 
        autoSetHints = true,
        hover_with_actions = true,
        runnables = { use_telescope = true },
        debuggables = { use_telescope = true },
        inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },
            auto_focus = false
        },
        crate_graph = {
            backend = "x11",
            output = nil, -- Relative path from wd, nil for no storage
            full = true,
        }
    },
    server = {} -- rust-analyzer options
}

require('rust-tools').setup(opts)

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


