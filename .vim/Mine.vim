" https://github.com/flazz/vim-colorschemes/blob/master/colors/Dark.vim

" Restore default colors
hi clear
set background=dark 


if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Mine"


hi Normal guibg=NONE guifg=grey90
hi NonText guibg=NONE guifg=grey10
"hi Cursor guibg=GhostWhite
"hi Cursor guibg=red guifg=white
hi Cursor guibg=green2 guifg=black
hi LineNr guifg=Orange

hi Statement  guifg=tan
hi Constant   guifg=#FC6C85
hi String     guifg=#FF6EC7
hi Comment    guifg=SkyBlue
hi PreProc    guifg=orchid2
hi Character  guifg=Cyan
hi Type       guifg=orange   gui=none
hi Special    guifg=#FFA0A0
hi Identifier guifg=#60DD60
hi link Function Identifier
"hi Function   guifg=#FFA0A0

" Slight tweaks after some time away:
hi Type guifg=LightMagenta
hi PreProc guifg=orange2


hi link SpecialKey Comment
hi link Directory  Comment

"
" Colors not part of the original set:
"
"hi Folded guifg=cyan4 guibg=grey20
hi Folded guifg=grey90 guibg=grey45
hi Visual gui=reverse guibg=fg guifg=darkolivegreen
hi Search guifg=black guibg=LightSkyBlue3 gui=none
"hi IncSearch guifg=yellow guibg=LightSkyBlue3 gui=bold
hi IncSearch guibg=blue guifg=yellow gui=bold
hi WarningMsg guifg=red guibg=GhostWhite gui=bold
hi Error guibg=red3


" Here are the original colors:
"hi guifg=grey70 gui=bold
"hi guifg=#FF7070 gui=bold
"hi guifg=green gui=bold
"hi guifg=yellow gui=bold
"hi guifg=SkyBlue gui=bold
"hi guifg=orchid1 gui=bold
"hi guifg=Cyan gui=bold
"hi guifg=White gui=bold
"
