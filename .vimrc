" Plugins
call plug#begin('~/.vim/plugged')

Plug 'JuliaEditorSupport/julia-vim'
Plug 'relastle/bluewery.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" For dark
colorscheme material
let g:material_theme_style = 'default'

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" Set encoding
set encoding=utf-8

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Set F9 to run python code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!clear; python' shellescape(@%, 1)<CR>

" Complete brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Markdown latex math
let g:vim_markdown_math = 1

set smartindent
set nu
set incsearch
set colorcolumn=80
