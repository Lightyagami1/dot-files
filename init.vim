set autoread        " detect if file changed outside of nvim
let mapleader = ','
set number          " Turn on line numbering. Turn it off with :set nonu
set rnu             " set relativenumber, to turn off :set norelu
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
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
" set spell spelllang=en_us " use [s, ]s, and then z= to correct
set noshowmode       " to remove extra --Insert -- at bottom line

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'

" Plug 'w0rp/ale' " asynchronously run completion

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': './install.sh'
"     \ }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'Shougo/vimproc.vim' , {'do' : 'make'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search

Plug 'airblade/vim-gitgutter' " Highlights altered lines in `gutter`
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes' " A collection of colorschemes.
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'   " Indentation syntax for languages
Plug 'vimwiki/vimwiki'
" Plug 'ervandew/supertab'
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

colorscheme Papercolor
set background=light
set background=dark
set termguicolors             " Turn on TrueColor

set wildchar=<Tab> wildmenu wildmode=full

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

set undofile
set undodir=~/.config/undodir " neovim specific

" ale configuration
" let g:airline#extensions#ale#enabled = 1
" hi link ALEError Error
" hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
" hi link ALEWarning Warning
" hi link ALEInfo SpellCap
" let g:ale_completion_enabled = 1 " making more use of ale

set formatprg=par "use gqip or gwip for vim's own formatter
set textwidth=79
" set formatoptions+=t "Automatically break at textwidth

let g:netrw_banner=0 " saner netrw 
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
autocmd FileType netrw setl bufhidden=wipe

nnoremap <C-p> :Files<Cr>

set clipboard=unnamed " now just yank instead of :w !pbcopy
set showmatch "show matching braces
" set foldmethod=syntax " fold based on indent
set pastetoggle=<leader>v " set paste toggle

filetype on
set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal


" Detect if vim is started as a diff tool (vim -d, vimdiff)
if &diff
  let s:is_started_as_vim_diff = 1
  syntax off
  setlocal nospell
endif


" vim fu
" to remove all extra spaces  :%s/\s\+$
" to print content of current buffer :TOhtml | w | !open -a Safari %
" tabularize first occurence of * /Tabularize /*.*/ : [.*] regex any char one
" or more times till end of line
