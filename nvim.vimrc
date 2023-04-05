" Source: slows down Vim when used multiple times
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" if has ('nvim')
"   autocmd BufWritePost ~/.vimrc source ~/.vimrc
" endif

" Lab: tab movement
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>

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
" tab navigation
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
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

" Neovim: WSL clipboard settings
let g:clipboard = {
      \   'name': 'WslClipboard',
      \   'copy': {
      \      '+': 'clip.exe',
      \      '*': 'clip.exe',
      \    },
      \   'paste': {
      \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \   },
      \   'cache_enabled': 0,
      \ }

" Neovim: disable mouse pop-up menu
set mouse=

" Neovim: disable Perl support
let g:loaded_perl_provider = 0

" Neovim: terminal mode
autocmd TermOpen * setlocal nonu nornu scl=no
tnoremap <leader><Esc> <C-\><C-n>

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
  endif
  Plug 'itchyny/vim-cursorword'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdtree'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" vim-airline:
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
" let g:airline#extensions#tabline#left_sep = '>'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

" indentLine:
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0

" undotree:
nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" Copilot: 
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" coc.nvim: extensions
let g:coc_global_extensions = ['coc-git', 'coc-pyright', 'coc-json', 'coc-markdownlint']

" coc.nvim: TAB for completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" coc.nvim: trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" coc.nvim: navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc.nvim: GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc.nvim: code actions
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Quick fix current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Code Lens current line
nmap <leader>cl  <Plug>(coc-codelens-action)
