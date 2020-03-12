set number
set relativenumber
set background=dark
set ignorecase
"set nohlsearch
let mapleader=","
let maplocalleader=","
set hidden
set wrap
set linebreak

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

call plug#begin('~/.local/share/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'ambv/black', { 'for': 'python' }
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'omnisharp/omnisharp-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'

call plug#end()

" Nerdtreee
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="right"

" Git gutter
let g:gitgutter_enabled=1
set updatetime=100

" Deoplete
let g:deoplete#enable_at_startup=1
set completeopt-=preview

" Ariline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled=1

" Ale
let g:ale_list_window_size=5
let g:airline#extensions#ale#enabled=1
"map <leader>e :ALEToggleBuffer<CR>
"let g:ale_open_list=1
highlight ALEError ctermbg=DarkMagenta
let b:ale_linters=['flake8', 'pylint']
let g:ale_sign_column_always=1
let g:ale_set_highlights=0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_open_list = 1
"let g:ale_list_vertical = 1

" Deoplete-jedi
if (filereadable('Pipfile'))
	let g:deoplete#sources#jedi#python_path='.venv/bin/python'
endif

" Black
autocmd BufWritePre *.py execute ':Black'

" Filetype
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab
autocmd Filetype json setlocal sw=2 sts=2 expandtab
autocmd Filetype yaml setlocal sw=2 sts=2 expandtab
autocmd Filetype html setlocal sw=2 sts=2 expandtab
autocmd Filetype python setlocal sw=4 sts=4 expandtab
autocmd BufNewFile,BufRead *.cshtml set syntax=html

" Ctrlp
let g:ctrlp_show_hidden=1

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"

" Ack
if executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" Tags
noremap <leader>t <c-]>

" Vimrc
command Vimrc execute ":e ~/.config/nvim/init.vim"
command Upvimrc execute ":so ~/.config/nvim/init.vim"
