set termguicolors

set background=dark

let g:deoplete#enable_at_startup = 1

call plug#begin('~/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'neomake/neomake'
Plug 'jacobsimpson/nvim-example-python-plugin'
Plug 'tpope/vim-git'
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'

call plug#end()

try
    colorscheme NeoSolarized
catch
endtry

call neomake#configure#automake('w')

" show line numbers
set number

" show matching paren
set showmatch

" hightlight current line
set cursorline

" Ignore case when searching
set ignorecase

" Be a little smarter about cases when searching
set smartcase

" Show the cursor position
set ruler

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Turn on wild menu for better command completion
set wildmenu

" don't wrap lines
set nowrap
set backspace=indent,eol,start
set copyindent
set hlsearch
set incsearch

set history=1000
set undolevels=1000

syntax on
scriptencoding utf-8
set encoding=utf-8
set virtualedit=onemore

set expandtab     " Use spaces instead of tabs
set smarttab      " Be smart when using tabs ;)
set shiftwidth=2  " Setup default ts
set tabstop=2
set softtabstop=2
set lbr           " Linebreak on 500 characters
set tw=80

set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set mouse=nicr    " Remove ME

" Home row jump to start and end of line
noremap H ^
noremap L $

autocmd Filetype sh setlocal ts=2 sw=2 sts=2 expandtab

" go to definition (Go)
autocmd FileType go nmap <buffer> <leader>g :GoDef<return>

" vim-go conf
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 1

let g:go_metalinter_command = "--enable=gotype --enable=vet --enable=golint --enable=gocyclo --enable=aligncheck --enable=gosimple -t"
let g:go_metalinter_autosave_enabled = [
      \  'golint',
      \  'gotype',
      \  'vet',
      \  'aligncheck',
      \  'gosimple',
      \]
"      \  'gocyclo',

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'vsplit')

" deoplete config
let g:deocomplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
set completeopt=longest,menuone,preview
let g:deocomplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.moon = []
let g:deoplete#omni#sources = {}
let g:deoplete#omni#sources.moon = ['buffer', 'file']

" deoplete golang config
let g:deoplete#omni#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#omni#sources#go#dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = expand('~/.cache/gocode')

" " deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" resizing
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" splits
nmap <leader>s<left> :new left
nmap <leader>s<right> :new right
nmap <leader>s<up> :new up
nmap <leader>s<down> :new down

" move between splits
nnoremap <c-j> <c-w>a
nnoremap <c-k> <c-w>d
nnoremap <c-h> <c-w>w
nnoremap <c-l> <c-w>s

" " Copy to clipboard
vnoremap y   "+y
vnoremap yy  "+yy
vnoremap Y   "+Y

" " Paste from clipboard 
vnoremap p   "+p
vnoremap P   "+P

