set title

" Mouse
"set mouse=a Background color
set background=dark

" Encoding set encoding=utf-8
set encoding=utf-8

" Line numbers
"set number
"set relativenumber

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

" An undo file
set undofile
set undodir=/tmp

" Misc
set hidden
syntax on
filetype plugin indent on
set nofoldenable

" Spell checker
map <F8> :setlocal spell! spelllang=en_us<CR>

" F5 clear white space
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Wildmenu
set wildmode=longest,list,full
set wildmenu

" Indent
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

au! BufNewFile,BufReadPost *.{js} set filetype=javascript
autocmd Filetype svelte setlocal sw=2 sts=2
autocmd Filetype javascript setlocal sw=2 sts=2
autocmd Filetype json setlocal sw=2 sts=2 expandtab
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd Filetype yaml setlocal sw=2 sts=2 ts=2 expandtab indentkeys-=<:>
autocmd Filetype html setlocal sw=2 sts=2 expandtab
autocmd Filetype python setlocal sw=4 sts=4 expandtab
au! BufNewFile,BufReadPost *.{tf,tfvars,hcl} setlocal sw=2 sts=2 expandtab filetype=terraform

" Vimrc
nnoremap <leader>ve :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree', { 'do': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " remember pip3 install --user pynvim
Plug 'SirVer/ultisnips'
Plug 'evanleck/vim-svelte'

call plug#end()

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Nerdtreee
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"

" Git gutter
let g:gitgutter_enabled=1
set updatetime=100

" Ctrlp
let g:ctrlp_show_hidden=1

" Deoplete
let g:deoplete#enable_at_startup=1

" Supertab
let g:SuperTabDefaultCompletionType="context"

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Ale
"let g:ale_open_list=1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_fix_on_save=1

" Ack
if executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Svelte
let g:svelte_indent_script=0
let g:svelte_indent_style=0
