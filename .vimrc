if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  augroup END
else
  set autoindent" always set autoindenting on
endif " has("autocmd")

set autoread
set number
set rnu
set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
let mapleader = ','
nnoremap <leader>N :setlocal number! relativenumber! list!<cr>
set backspace=indent,eol,start " <Backspace> in Insert mode
set cursorline
" Show cursor line in current window and not in insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END



set incsearch
set ignorecase
set hlsearch
set smartcase
set hidden
set noshowmode

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular' " For alligning :Tabularize /= (for = allignment)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search
call plug#end()

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
set undodir=~/.vim/undodir
set backupdir=~/.vim/backup

set tags=tags

set autoindent
set shiftwidth=2
set expandtab
set smarttab
set formatprg=par "use gqip or gwip for vim's own formatter
set formatoptions+=t "Automatically break at textwidth

"au BufNewFile,BufRead *.h setf c
"au BufNewFile,BufRead *.mk setf make

"au BufEnter * set vb t_vb=
"au BufEnter * cd %:p:h
" au BufEnter * if &readonly | setl nomodifiable | endif
" au BufEnter *.log setl readonly nomodifiable

" au FileType make,conf set noexpandtab nosmarttab

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
autocmd FileType netrw setl bufhidden=wipe

nnoremap <C-p> :Files<Cr> " fzf mapping

" set clipboard=unnamed " now just yank instead of :w !pbcopy
set showmatch "show matching braces
" set foldmethod=syntax " fold based on indent
set pastetoggle=<leader>V " set paste toggle


filetype on
set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal


" Detect if vim is started as a diff tool (vim -d, vimdiff)
if &diff
  let s:is_started_as_vim_diff = 1
  syntax off
  set list! number! relativenumber!
endif

colorscheme dracula
" set background=dark
" set background=light
set t_Co=256

" Launch gopls when Go files are in use
" let g:LanguageClient_serverCommands = {
"        \ 'go': ['gopls']
"        \ }


" if strftime("%H") > 9 && strftime("%H") < 12
"   set background=light
"   :hi CursorLine guibg=lightblue ctermbg=lightblue
"   set nolist
" else
"   set background=dark
" endif

set tags=./tags;/

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


