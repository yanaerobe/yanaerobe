" Plugins and configs

" vim-plug: plugin manager
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
    " Copilot: invoke `:Copilot setup` after installation
    Plug 'github/copilot.vim'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': 'python3 -m chadtree deps' }
    " Lab: 
    Plug 'junegunn/vim-easy-align'
    Plug 'yaegassy/coc-black-formatter', {'do': 'yarn install --frozen-lockfile'}
  else
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
  endif
  " Plug 'itchyny/vim-cursorword'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'tpope/vim-commentary'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-surround'
call plug#end()

" Lab: vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" LeaderF functions
nnoremap <silent> <leader>F :Leaderf rg<CR>
nnoremap <silent> <leader>m :Leaderf mru<CR>
let g:Lf_TabpagePosition = 3
if has('nvim')
  let g:Lf_StlSeparator = { 'left': '', 'right': '' }
endif

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
let g:copilot_filetypes = {
      \ 'markdown': v:false,
      \ }
