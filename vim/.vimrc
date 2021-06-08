" =====================================================================================
" ===                          Plugins                                              ===
" =====================================================================================

" Vundle setup
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'

call vundle#end()


" =====================================================================================
" ===                          Vim Settings                                         ===
" =====================================================================================
filetype plugin indent on

set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces
set rnu             " Relative line numbers
set colorcolumn=88  " Highlight column 88
set laststatus=2    " Fix for lightline
set noshowmode      " Hide --INSERT--

" Override for .yaml files
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab


" =====================================================================================
" ===                          Key Remappings                                       ===
" =====================================================================================
" Generic keys
let mapleader = " " " map leader to Space
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" NERDTree keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" =====================================================================================
" ===                          Scripts                                              ===
" =====================================================================================
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" =====================================================================================
" ===                          Colorscheme                                          ===
" =====================================================================================
" Set syntax highlighting colorscheme
syntax enable
set background=dark
colorscheme solarized

" Fix solarized colorscheme in terminal
if !has('gui_running')
    set t_Co=256
endif

" Set lightline colorscheme
let g:lightline = { 'colorscheme': 'solarized' }
