set autoread        " detect if file changed outside of nvim
set nocompatible
let mapleader = ","
set number          " Turn on line numbering. Turn it off with :set nonu
set rnu             " set relativenumber, to turn off :set norelu
" set list
" set listchars=tab:❯\ ,extends:❯,precedes:❮
" set listchars=tab:▸\ ,eol:¬,trail:¬,extends:❯,precedes:❮
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59
nnoremap <leader>N :setlocal number! relativenumber! list!<cr>
set backspace=indent,eol,start " <Backspace> in Insert mode
" set cursorline
" set mouse=ivc " mouse selection, resize
set showcmd
set inccommand=nosplit
set iskeyword+=-
set ttyfast
" set lazyredraw
" autocmd VimResized * :wincmd =
" set signcolumn=number
set updatetime=200
set matchpairs+=<:>

" Show cursor line in current window and not in insert mode
" augroup aug_cursor_line
"   au!
"   au InsertEnter * setlocal nocursorline
"   au InsertLeave * setlocal cursorline
" augroup END

" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"   \,sm:block-blinkwait175-blinkoff150-blinkon175

" open new split panes to right and below
set splitright
set splitbelow

" set completeopt=menu,preview,noinsert " Do not insert first sugggestion
set completeopt=menu,preview

" set complete+=kspell " this gives access to dictionary of vim :)
" set spell spelllang=en_us " use [s, ]s, and then z= to correct
set noshowmode       " to remove extra --Insert -- at bottom line

" Additional <ESC> mappings:
inoremap jk <ESC> " jk, in INSERT mode
inoremap kj <ESC> " kj, in INSERT mode

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'neovimhaskell/haskell-vim'
Plug 'airblade/vim-gitgutter' " Highlights altered lines in `gutter`
Plug 'editorconfig/editorconfig-vim' " white space automatic
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'flazz/vim-colorschemes' " A collection of colorschemes.
" Plug 'mswift42/vim-themes'
" Plug 'mcchrish/zenbones.nvim'
" Plug 'rktjmp/lush.nvim'
Plug 'godlygeek/tabular'      " Align text :Tabularize /{char} to align
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fzf for fuzzy search
" Plug 'majutsushi/tagbar'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sheerun/vim-polyglot'   " Indentation syntax for languages
Plug 'simplyzhao/cscope_maps.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-sleuth' " indenting related configuration
" Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-obsession'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'mxsdev/nvim-dap-vscode-js'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'
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
set shiftwidth=2
set wildignore=*.swp,*.bak    " Exclude these files from *

" some good ones with both dark & light: dracula, one, kuroi
" colorscheme nord
" colorscheme genericdc-light
" colorscheme Atelier_SavannaLight
" colorscheme whitebox
colo seoul256-light
" colorscheme hybrid_material
" colorscheme space-vim-dark
" set background=dark
set termguicolors             " Turn on TrueColor

" set wildchar=<Tab> wildmenu wildmode=list:longest,full

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

set undofile
set undodir=~/.config/undodir " neovim specific

set formatprg=par "use gqip or gwip for vim's own formatter
" set textwidth=98
" set formatoptions+=t "Automatically break at textwidth

let g:netrw_banner=0 " saner netrw
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
" don't create a small window in left hand side, instead open in current
" buffer
" let g:netrw_browse_split = 4
let g:netrw_browse_split = 0
let g:netrw_winsize = 20
autocmd FileType netrw setl bufhidden=wipe

set clipboard=unnamed " now just yank instead of :w !pbcopy
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

" noremap ,cpp : -1read $HOME/Dropbox/awesomeness/coding/skeleton.cpp<CR>11j
" noremap ,hsp : -1read $HOME/jungle/train/hskel.hs<CR>10j
noremap ,jlj : -1read $HOME/nutanix/cl.js<CR>f'

" set tags=./tags;,tags;$HOME

" if strftime("%H") > 9 && strftime("%H") < 15
"   set background=light
"   " :hi CursorLine guibg=lightblue ctermbg=lightblue
"   " set nolist
" else
"   set background=dark
" endif

" for terminal esc to chage to normal mode
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
" au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert

" set nocscopeverbose "don't show added cscope message

" make folds consistent
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

set cmdheight=1
" set shortmess+=c

" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" hopefully when back in competetive coding
" autocmd FileType cpp nnoremap     <leader>rm    :!g++ -g --std=c++17 % -o %:r<CR>
" autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
" autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>


" command! PrettyPrintJSON %!python -m json.tool
" command! PrettyPrintHTML !tidy -mi -html -wrap 0 %

" remove highlighting on escape
nnoremap <silent> <esc> :nohlsearch<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" background change
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
map <Leader>cg :source ~/.config/nvim/init.vim<CR>
map <Leader>af :Ag<CR>
map <Leader>fa :FZF<CR>
map <Leader>ff :Files<CR>
map <Leader>re :Rexplore<CR>
map <Leader>er :Explore<CR>

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'separator': { 'left': "|", 'right': "|" },
      \ 'subseparator': { 'left': "", 'right': "" }
      \ }
      " \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      " \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=300, on_visual=true}

" autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
"
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap t% :call OpenCurrentAsNewTab()<CR>
nmap td :tabclose<CR>

" To get Ctrl+l working in terminal mode
tnoremap <C-l> <C-\><C-n>:call ClearTerminal()<cr>
let s:scroll_value = 3000
let &scrollback=s:scroll_value                 " Reset/clean terminal like, we can't scrollback upwards
function! ClearTerminal()
  set scrollback=1
  let &g:scrollback=1
  echo &scrollback
  call feedkeys("\i")
  call feedkeys("clear\<CR>")
  call feedkeys("\<C-\>\<C-n>")
  call feedkeys("\i")
  sleep 100m
  let &scrollback=s:scroll_value
endfunction



nnoremap <silent> <Leader>cn <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>so <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>s <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>st <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>t <Cmd>lua require'dap'.terminate()<CR>

" to remove status line completely
" lua vim.o.ls = 0
" lua vim.o.ch = 0
" set laststatus=3



lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = '/Users/sk/.nvm/versions/node/v12.12.0/bin/node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      processId = require'dap.utils'.pick_process,
  },
}
EOF

lua require('dap-go').setup()

lua << EOF
local dap, dapui =require("dap"),require("dapui")
dapui.setup {
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 }
      },
      size = 40, -- 40 columns
      position = "left",
    },
  },
}
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end
EOF

vnoremap <silent> <Leader>l <Cmd>lua require'dapui'.eval()<CR>

" lua << EOF
" -- Mappings.
" -- See `:help vim.diagnostic.*` for documentation on any of the below functions
" local opts = { noremap=true, silent=true }
" vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
" vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
" vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
" vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"   -- Enable completion triggered by <c-x><c-o>
"   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

"   -- Mappings.
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   local bufopts = { noremap=true, silent=true, buffer=bufnr }
"   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
"   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
"   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
"   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
"   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
"   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
"   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
"   vim.keymap.set('n', '<space>wl', function()
"     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
"   end, bufopts)
"   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
"   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
"   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
"   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
"   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
" end

" local lsp_flags = {
"   -- This is the default in Nvim 0.7+
"   debounce_text_changes = 150,
" }
" require('lspconfig')['tsserver'].setup{
"     on_attach = on_attach,
"     flags = lsp_flags,
" }
" EOF

" lua << EOF
" require("mason").setup()
" require("mason-lspconfig").setup({
"     ensure_installed = { "tsserver" }
" })
" EOF


au BufRead,BufNewFile *.md setlocal textwidth=80
