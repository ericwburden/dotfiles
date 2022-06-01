"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-/>'

let g:fzf_layout = { 'down': '~10%' }

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'altercation/vim-colors-solarized'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim'
    Plug 'jpalardy/vim-slime'
    Plug 'preservim/nerdtree'

    Plug 'itchyny/lightline.vim'
    Plug 'josa42/nvim-lightline-lsp'
    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Language syntax support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'cespare/vim-toml'
    Plug 'rust-lang/rust.vim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'nvim-lua/completion-nvim'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Julia plugins
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set history=500
filetype plugin indent on
set autoread
set laststatus=2
set noshowmode
set signcolumn=yes
au FocusGained,BufEnter * checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=18
set number relativenumber
set wildmenu
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set updatetime=600


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized
set encoding=utf8
set ffs=unix,dos,mac
highlight Normal ctermbg=none
highlight NonText ctermbg=none

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ ,
    \   'right': [ [ 'lineinfo' ],
    \              ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
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
let g:lightline#lsp#indicator_checking = "\u2941"
let g:lightline#lsp#indicator_infos = "\u2139"
let g:lightline#lsp#indicator_warnings = "\u26a0"
let g:lightline#lsp#indicator_errors = "\u2718"
let g:lightline#lsp#indicator_ok = "\u2714"
let g:lightline.separator = {
    \   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
    \   'left': '', 'right': ''
\}
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set colorcolumn=88
set lbr
set tw=500
set ai
set si
set wrap
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
" => Key Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Insert mode keybindings
inoremap <C-j> <Esc>
inoremap <C-k> <Esc> <bar> :w<CR>
inoremap <C-k><C-k> <Esc> <bar> :wq<CR>

" Visual mode keybindings
vnoremap <C-j> <Esc>

" Normal mode keybindings
nnoremap <C-k> :w<CR>
nnoremap <C-k><C-k> :wq<CR>

" NERDTree keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" VimTest keys
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" fzf bindings
nmap <leader><CR> :FZF<CR>
nmap <silent> <leader><leader> :w!<CR>
map <leader>s :Ag<space>
map <silent> <leader><ESC> :noh<CR>

" LSP bindings
" - Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" - Use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" - Code navigation shortcuts
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

" - Emmet
inoremap <C-e> <Esc>:Emmet<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Show LSP popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Treesitter setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
      enable = true
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufRead * normal            zR                  " Default to unfolded
autocmd BufRead,BufNewFile *.jl		set filetype=julia  " Detect julia files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LSP Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF

-- Need to add a line here for each language server of interest
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.pyright.setup{}
require'lspconfig'.vuels.setup{on_attach=require'completion'.on_attach}

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,

        runnables = {
            use_telescope = true
            -- rest of the opts are forwarded to telescope
        },

        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix  = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
        },

        hover_actions = {
            border = {
              {"╭", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╮", "FloatBorder"},
              {"│", "FloatBorder"},
              {"╯", "FloatBorder"},
              {"─", "FloatBorder"},
              {"╰", "FloatBorder"},
              {"│", "FloatBorder"}
            },
        }
    },

    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {}, -- rust-analyer options
}
require('rust-tools').setup(opts)
EOF

hi LspDiagnosticsVirtualTextError guifg=red gui=bold,italic,underline ctermfg=167:
hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline ctermfg=179
hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline ctermfg=195
hi LspDiagnosticsVirtualTextHint guifg=green gui=bold,italic,underline ctermfg=194

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra Julia Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Julia language server doesn't seem to get along with native LSP, so it uses
" the LanguageClient plugin

let g:default_julia_version = '1.6'
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim SLIME Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}


