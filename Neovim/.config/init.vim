set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'w0rp/ale'
Plug 'tfnico/vim-gradle'
Plug 'scrooloose/nerdtree'

call plug#end()

" Copy/Paste things

:command -range Cz :silent :<line1>,<line2>w !xsel -i -b
:command -range Cx :silent :<line1>,<line2>w !xsel -i -p
:command -range Cv :silent :<line1>,<line2>w !xsel -i -s
:cabbrev cv Cv
:cabbrev cz Cz
:cabbrev cx Cx

:command -range Pz :silent :r !xsel -o -b
:command -range Px :silent :r !xsel -o -p
:command -range Pv :silent :r !xsel -o -s

:cabbrev pz Pz
:cabbrev px Px
:cabbrev pv Pv


" NeoSolarized config

colorscheme NeoSolarized

set background=dark
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0


" Vim Better Whitespace config

let g:better_whitespace_ctermcolor='cyan'
let g:better_whitespace_guicolor='cyan'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Vim Git Gutter config

let g:gitgutter_max_signs = 5000
highlight SignColumn ctermbg=magenta    " terminal Vim
highlight SignColumn guibg=magenta      " gVim/MacVim

" Vim Easy Align config

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Deoplete.nvim config

let g:deoplete#enable_at_startup = 1

" Ale.vim config

let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'C++': ['clang'],
\   'Kotlin': ['kotlinc'], 
\}

" NERDTree config

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
