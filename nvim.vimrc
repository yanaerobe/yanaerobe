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

" General: window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" General: leader related
let mapleader=" "
nmap <leader>w :w<CR>
" Buffer navigation
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
" Window zoom
nnoremap <leader>= :exe "vertical resize " . (winwidth(0) * 4/3)<CR>

" Lab: tab navigation
nnoremap <leader>N :tabnew<CR>
nnoremap <leader>L :tabNext<CR>
nnoremap <leader>H :tabprevious<CR>

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

" Plugins
source ~/yanaerobe/.vim/plugins.vim

" coc.nvim
source ~/yanaerobe/.vim/coc.vim
