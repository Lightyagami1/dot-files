set autoread        " detect if file changed outside of nvim
set nocompatible
let mapleader = ","
set number          " Turn on line numbering. Turn it off with :set nonu
set rnu             " set relativenumber, to turn off :set norelu
set list
set listchars=tab:▸\ ,eol:⋅,trail:¬,extends:❯,precedes:❮
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
nnoremap <leader>N :setlocal number! relativenumber! list!<cr>
set backspace=indent,eol,start " <Backspace> in Insert mode
set cursorline
set mouse=ivc " mouse selection, resize
set showcmd
set inccommand=nosplit
set iskeyword+=-

" Show cursor line in current window and not in insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" open new split panes to right and below
set splitright
set splitbelow

" set completeopt=menu,preview,noinsert " Do not insert first sugggestion
set completeopt=menu,preview " Do not insert first sugggestion

" set complete+=kspell " this gives access to dictionary of vim :)
" set spell spelllang=en_us " use [s, ]s, and then z= to correct
set noshowmode       " to remove extra --Insert -- at bottom line

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode
inoremap kj <ESC> " kj, in INSERT mode

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter' " Highlights altered lines in `gutter`
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim' " white space automatic
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'flazz/vim-colorschemes' " A collection of colorschemes.
Plug 'godlygeek/tabular'      " Align text :Tabularize /{char} to align
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'   " Indentation syntax for languages
Plug 'simplyzhao/cscope_maps.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' " indenting related configuration
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-which-key'
call plug#end()


set hidden                    " hides buffers instead of closing them
set incsearch                 " Highlights search results as you type
set ignorecase                " Ignore case when searching
set smartcase
set hlsearch                  " Turns search highlighting on

au FileType make,conf set noexpandtab nosmarttab

"example defaults for new projects
set expandtab
set tabstop=2
set updatetime=200
set timeoutlen=500
set shiftwidth=2
set wildignore=*.swp,*.bak    " Exclude these files from *

colorscheme dracula
set termguicolors             " Turn on TrueColor

" set wildchar=<Tab> wildmenu wildmode=list:longest,full

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let g:airline_theme='dracula'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
" let g:airline_section_z = ''
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr=''

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

"set clipboard=unnamed " now just yank instead of :w !pbcopy
set showmatch "show matching braces
set foldmethod=manual " fold based on indent
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

noremap ,cpp : -1read $HOME/jungle/train/skeleton.cpp<CR>11j
noremap ,hsp : -1read $HOME/jungle/train/hskel.hs<CR>10j

set tags=./tags;,tags;$HOME

" if strftime("%H") < 9 && strftime("%H") > 15
"   set background=light
"   :hi CursorLine guibg=lightblue ctermbg=lightblue
"   set nolist
" else
"   set background=dark
" endif

" for terminal esc to chage to normal mode
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set nocscopeverbose "don't show added cscope message

" make folds consistent
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

set cmdheight=1
set shortmess+=c

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" hopefully when back in competetive coding
autocmd FileType cpp nnoremap     <leader>rm    :!g++ -g --std=c++17 % -o %:r<CR>
autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>


command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %

 " remove highlighting on escape
  nnoremap <silent> <esc> :nohlsearch<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" background change
map <C-b> :set background=dark<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>


nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }


let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }
call which_key#register('<Space>', "g:which_key_map")
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
