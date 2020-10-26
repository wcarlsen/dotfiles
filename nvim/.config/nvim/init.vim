" Title
set title

" Mouse
set mouse=a

" Background color
set background=dark

" Encoding
set encoding=utf-8

" Line numbers
set number
set relativenumber

" Matching
set showmatch

" Search
set ignorecase
set incsearch
set hlsearch

" Backspace
set bs=2

" Leader
let mapleader=","
let maplocalleader=","

" Split
set splitbelow
set splitright

" Word wrap
set wrap
set linebreak

" Misc
set hidden

" Indent
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab
autocmd Filetype json setlocal sw=2 sts=2 expandtab
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd Filetype yaml setlocal sw=2 sts=2 ts=2 expandtab indentkeys-=<:>
autocmd Filetype html setlocal sw=2 sts=2 expandtab
autocmd Filetype python setlocal sw=4 sts=4 expandtab
au! BufNewFile,BufReadPost *.{tf,tfvars,hcl} setlocal sw=2 sts=2 expandtab

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', { 'do': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Nerdtreee
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"

" Git gutter
let g:gitgutter_enabled=1
set updatetime=100

" Ctrlp
let g:ctrlp_show_hidden=1

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"

" Ack
if executable('ag')
	"let g:ackprg='ag --vimgrep'
endif

" Vim-terraform
let g:terraform_align=1
