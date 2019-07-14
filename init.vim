set autoread        " detect if file changed outside of nvim
let mapleader = ","
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

" set completeopt=menu,preview,noinsert " Do not insert first sugggestion
set completeopt=menu,preview " Do not insert first sugggestion

set complete+=kspell " this gives access to dictionary of vim :)
" set spell spelllang=en_us " use [s, ]s, and then z= to correct
set noshowmode       " to remove extra --Insert -- at bottom line

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode
inoremap kj <ESC> " kj, in INSERT mode

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search
Plug 'majutsushi/tagbar'
" Plug 'airblade/vim-gitgutter' " Highlights altered lines in `gutter`
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-commentary'
" Plug 'flazz/vim-colorschemes' " A collection of colorschemes.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'sheerun/vim-polyglot'   " Indentation syntax for languages
Plug 'simplyzhao/cscope_maps.vim'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'      " Align text :Tabularize /{char} to align
call plug#end()

set updatetime=200

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

set wildchar=<Tab> wildmenu wildmode=list:longest,full

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
" let g:airline_section_z = ''

set undofile
set undodir=~/.config/undodir " neovim specific

set formatprg=par "use gqip or gwip for vim's own formatter
set textwidth=78
" set formatoptions+=t "Automatically break at textwidth

let g:netrw_banner=0 " saner netrw
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
autocmd FileType netrw setl bufhidden=wipe

set clipboard=unnamed " now just yank instead of :w !pbcopy
set showmatch "show matching braces
" set foldmethod=syntax " fold based on indent
set pastetoggle=<leader>V " set paste toggle

filetype on
set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal

" Detect if vim is started as a diff tool (vim -d, vimdiff)
if &diff
  let s:is_started_as_vim_diff = 1
  set nolist
  syntax off
  setlocal nospell
endif

" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

noremap ,cpp : -1read $HOME/jungle/train/skeleton.cpp<CR>10j

set tags=./tags;,tags;$HOME

if strftime("%H") < 14 && strftime("%H") > 7
  set background=light
  :hi CursorLine guibg=lightblue ctermbg=lightblue
  set nolist
else
  set background=dark
endif

" for terminal esc to chage to normal mode
tnoremap <Esc> <C-\><C-n>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set nocscopeverbose "don't show added cscope message
