" General: basic
set nu rnu ruler
set autoread 
set expandtab smarttab
set incsearch hlsearch ignorecase smartcase
set undofile

" General: indentation & tab
set autoindent shiftwidth=2 tabstop=2 softtabstop=2

" General: config with nums
set laststatus=2 cmdheight=2 pumheight=10 signcolumn=yes updatetime=100

" General: leader related basics
let mapleader=" "
nmap <leader>w :w<CR>
" buffer navigation
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
" window zoom
nnoremap <leader>= :exe "vertical resize " . (winwidth(0) * 4/3)<CR>

" General: window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" General: remember cursor postion
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" General: ftdetect
autocmd BufRead,BufNewFile *.zsh-theme set ft=zsh
autocmd BufRead,BufNewFile *.zshrc set ft=zsh

if has('nvim')
  " " Neovim: WSL clipboard settings
  " let g:clipboard = {
  "       \   'name': 'WslClipboard',
  "       \   'copy': {
  "       \      '+': 'clip.exe',
  "       \      '*': 'clip.exe',
  "       \    },
  "       \   'paste': {
  "       \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  "       \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  "       \   },
  "       \   'cache_enabled': 0,
  "       \ }

  " Neovim: disable mouse pop-up menu
  set mouse=

  " Neovim: disable Perl support
  let g:loaded_perl_provider = 0

  " Neovim: terminal mode
  autocmd TermOpen * setlocal nonu nornu scl=no
  tnoremap <leader><Esc> <C-\><C-n>
endif

" vim-plug: curL
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug: in proficiency order
call plug#begin()
  if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'dhruvasagar/vim-table-mode'
    " Copilot: invoke `:Copilot setup` after installation
    Plug 'github/copilot.vim'
    Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': 'python3 -m chadtree deps' }
  else
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
  endif
  Plug 'itchyny/vim-cursorword'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-surround'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" Lab: LeaderF functions
nnoremap <silent> <leader>F :Leaderf rg<CR>
nnoremap <silent> <leader>m :Leaderf mru<CR>
let g:Lf_TabpagePosition = 3
if has('nvim')
  let g:Lf_StlSeparator = { 'left': '', 'right': '' }
endif

" Lab: tab navigation
nnoremap <leader>N :tabnew<CR>
nnoremap <leader>L :tabNext<CR>
nnoremap <leader>H :tabprevious<CR>

" vim-commentary:
autocmd FileType systemverilog setlocal commentstring=//\ %s

" vim-airline:
if has('nvim')
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_theme='molokai'
else
  let g:airline_left_sep='>'
  let g:airline_right_sep='<'
  let g:airline#extensions#tabline#left_sep = '>'
endif

" indentLine:
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0

" WHATTree:
if has('nvim')
  nnoremap <silent> <F4> :CHADopen<CR>
else
  nnoremap <silent> <F4> :NERDTreeToggle<CR>
endif

" undotree:
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" Copilot: 
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_enabled = v:false
let g:copilot_no_tab_map = v:true

source ~/yanaerobe/.vim/coc.vim
