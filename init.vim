let mapleader = ','
set number           " Turn on line numbering. Turn it off with :set nonu
set rnu              " set relativenumber, to turn off :set norelu
set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
nnoremap <leader>N :setlocal number! relativenumber! list!<cr>
set backspace=indent,eol,start " <Backspace> in Insert mode
set cursorline
" Show cursor line in current window and not in insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

set completeopt=menu,preview,noinsert " Do not insert first sugggestion

set complete+=kspell " this gives access to dictionary of vim :)
set spell spelllang=en_us " use [s, ]s, and then z= to correct
set noshowmode       " to remove extra --Insert -- at bottom line

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode
noremap <C-C> <ESC> " <C-c>, like shell environment
xnoremap <C-C> <ESC>

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'tpope/vim-surround'

" Plug 'w0rp/ale' " asynchronously run completion

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/vimproc.vim' , {'do' : 'make'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search

Plug 'airblade/vim-gitgutter' " Highlights altered lines in `gutter`
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'   " Later in the config I'll bind this plugin to `gc`
Plug 'flazz/vim-colorschemes' " A collection of colorschemes.
Plug 'sheerun/vim-polyglot'   " Indentation syntax for languages
Plug 'vimwiki/vimwiki'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'      " Align text :Tabularize /{char} to align
call plug#end()

set updatetime=300

set hidden                    " hides buffers instead of closing them
set incsearch                 " Highlights search results as you type
set ignorecase                " Ignore case when searching
set smartcase
set hlsearch                  " Turns search highlighting on

au FileType make,conf set noexpandtab nosmarttab

set shiftwidth=2
set wildignore=*.swp,*.bak    " Exclude these files from *

colorscheme molokai
set background=dark
set termguicolors             " Turn on TrueColor
" set background=light

set wildchar=<Tab> wildmenu wildmode=full

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

set undofile
set undodir=~/.vim/undodir

" ale configuration
" let g:airline#extensions#ale#enabled = 1
" hi link ALEError Error
" hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
" hi link ALEWarning Warning
" hi link ALEInfo SpellCap
" let g:ale_completion_enabled = 1 " making more use of ale

set formatprg=par "use gqip or gwip for vim's own formatter
set textwidth=72
set formatoptions+=t "Automatically break at textwidth

let g:netrw_banner=0 " saner netrw 
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
autocmd FileType netrw setl bufhidden=wipe

nnoremap <C-p> :Files<Cr>
