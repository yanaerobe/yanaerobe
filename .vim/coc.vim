" coc.nvim configs

" Extensions
let g:coc_global_extensions = [
      \ 'coc-git', 'coc-pyright', 'coc-json', 'coc-markdownlint',
      \ 'coc-sh', 'coc-calc', 'coc-vimlsp', 'coc-syntax'
      \ ]

" Lab: Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Lab: Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Lab: coc-calc
" append result on current expression
nmap <Leader>ca <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)

" Call buffer formatting with `:Format`
command! -nargs=0 Format :call CocActionAsync('format')

" TAB for completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Code actions
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Quick fix current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Refactor code actions
nmap <silent> <leader>rf <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)

" Code Lens current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Conflict navigation
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)

" Show commit in current position
nmap gcm <Plug>(coc-git-commit)
