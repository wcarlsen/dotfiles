set background=dark
set ignorecase

" Leader
let mapleader = ","
let maplocalleader = ","

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'ambv/black', { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Nerdtreee
map <C-n> :NERDTreeToggle<CR>

" Git gutter
let g:gitgutter_enabled = 1
set updatetime=100

" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Ale
let g:ale_list_window_size = 5
let g:airline#extensions#ale#enabled = 1
"map <leader>e :ALEToggleBuffer<CR>
"let g:ale_open_list = 1
highlight ALEError ctermbg=DarkMagenta
let b:ale_linters = ['flake8', 'pylint']

" Deoplete-jedi
if (filereadable('Pipfile'))
	let g:deoplete#sources#jedi#python_path = '.venv/bin/python'
endif

" Black
autocmd BufWritePre *.py execute ':Black'

autocmd Filetype javascript setlocal sw=2 sts=2 expandtab
