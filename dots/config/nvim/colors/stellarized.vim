" Based on github.com/nightsense/stellarized 

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'stellarized'

" Palette
"
" Background: light
" grey0  #fceee0
" grey1  #ecdac9
" grey2  #666c85
" grey3  #4a5067
" grey4  #2d3243
" grey5  #2d3243
" grey6  #bead9d
"
" yellow #ffd506
" gold   #8b6800
"
" blue0  #0082ff
" blue1  #006dcc
"
" teal0  #0093b3
" teal1  #007989
"
" pink   #c709dd
"
" red0   #f7003c
" red1   #c6394c
"
" green  #007f25
"
" purple #a348ae
"
" Background: dark
" gry0 #222532
" gry1 #2d3243
" gry2 #9d8875
" gry3 #bead9d
" gryc #ecdac9
" srch #8d6e19
" grys #ecdac9
" gryp #4a5067
" sprd #ff707e
" spbl #00b4ff
" spcy #00c8d9
" spmg #ee81f9
" red_ #ca7375
" gold #a58949
" gren #5c9a61
" cyan #009ba2
" blue #578fcc
" mgnt #b178b5

if &background ==# 'dark'
  hi Bold             guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
  hi Conceal          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Directory        guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
  hi EndOfBuffer      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Ignore           guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Italic           guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,italic
  hi ModeMsg          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi MoreMsg          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Question         guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi NonText          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Normal           guifg=#bead9d guibg=#222532 guisp=NONE    gui=NONE
  hi Terminal         guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
  hi Title            guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
  hi Underlined       guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,underline
  hi Comment          guifg=#9d8875 guibg=NONE    guisp=NONE    gui=NONE
  hi CursorLineNr     guifg=#9d8875 guibg=NONE    guisp=NONE    gui=NONE
  hi LineNr           guifg=#9d8875 guibg=NONE    guisp=NONE    gui=NONE
  hi FoldColumn       guifg=#bead9d guibg=NONE    guisp=NONE    gui=NONE
  hi PmenuSel         guifg=#bead9d guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi SignColumn       guifg=#bead9d guibg=NONE    guisp=NONE    gui=NONE
  hi StatusLine       guifg=#bead9d guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi StatusLineTerm   guifg=#bead9d guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi TabLineSel       guifg=#bead9d guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi VisualNOS        guifg=#9d8875 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Cursor           guifg=#ecdac9 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi IncSearch        guifg=#ecdac9 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi ColorColumn      guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi CursorColumn     guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi CursorLine       guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi DiffChange       guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi Folded           guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi MatchParen       guifg=#ecdac9 guibg=#4a5067 guisp=NONE    gui=NONE
  hi Pmenu            guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE
  hi QuickFixLine     guifg=NONE    guibg=#2d3243 guisp=NONE    gui=NONE
  hi StatusLineNC     guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE
  hi StatusLineTermNC guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE
  hi TabLine          guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE
  hi ToolbarButton    guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE,bold
  hi WildMenu         guifg=#bead9d guibg=#2d3243 guisp=NONE    gui=NONE
  hi PmenuSbar        guifg=#4a5067 guibg=#4a5067 guisp=NONE    gui=NONE
  hi PmenuThumb       guifg=#bead9d guibg=#bead9d guisp=NONE    gui=NONE
  hi TabLineFill      guifg=#2d3243 guibg=#2d3243 guisp=NONE    gui=NONE
  hi ToolbarLine      guifg=#2d3243 guibg=#2d3243 guisp=NONE    gui=NONE
  hi VertSplit        guifg=#4a5067 guibg=#4a5067 guisp=NONE    gui=NONE
  hi SpellBad         guifg=NONE    guibg=NONE    guisp=#ff707e gui=NONE,undercurl
  hi SpellCap         guifg=NONE    guibg=NONE    guisp=#00b4ff gui=NONE,undercurl
  hi SpellLocal       guifg=NONE    guibg=NONE    guisp=#00c8d9 gui=NONE,undercurl
  hi SpellRare        guifg=NONE    guibg=NONE    guisp=#ee81f9 gui=NONE,undercurl
  hi StorageClass     guifg=#a58949 guibg=NONE    guisp=NONE    gui=NONE
  hi Structure        guifg=#a58949 guibg=NONE    guisp=NONE    gui=NONE
  hi Type             guifg=#a58949 guibg=NONE    guisp=NONE    gui=NONE
  hi Typedef          guifg=#a58949 guibg=NONE    guisp=NONE    gui=NONE
  hi TooLong          guifg=#b178b5 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi WarningMsg       guifg=#b178b5 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Function         guifg=#578fcc guibg=NONE    guisp=NONE    gui=NONE
  hi Identifier       guifg=#578fcc guibg=NONE    guisp=NONE    gui=NONE
  hi DiffDelete       guifg=#ca7375 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi DiffRemoved      guifg=#ca7375 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Error            guifg=#ca7375 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi ErrorMsg         guifg=#ca7375 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Debug            guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi Delimiter        guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi Special          guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi SpecialChar      guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi SpecialComment   guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi SpecialKey       guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi Tag              guifg=#ca7375 guibg=NONE    guisp=NONE    gui=NONE
  hi DiffChanged      guifg=#a58949 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi DiffText         guifg=#a58949 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Search           guifg=#8d6e19 guibg=#ecdac9 guisp=NONE    gui=NONE,reverse
  hi Conditional      guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Exception        guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Keyword          guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Label            guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Operator         guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Repeat           guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi Statement        guifg=#5c9a61 guibg=NONE    guisp=NONE    gui=NONE
  hi DiffAdd          guifg=#5c9a61 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi DiffAdded        guifg=#5c9a61 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Define           guifg=#b178b5 guibg=NONE    guisp=NONE    gui=NONE
  hi Include          guifg=#b178b5 guibg=NONE    guisp=NONE    gui=NONE
  hi Macro            guifg=#b178b5 guibg=NONE    guisp=NONE    gui=NONE
  hi PreCondit        guifg=#b178b5 guibg=NONE    guisp=NONE    gui=NONE
  hi PreProc          guifg=#b178b5 guibg=NONE    guisp=NONE    gui=NONE
  hi Todo             guifg=#009ba2 guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi Boolean          guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi Character        guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi Constant         guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi Float            guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi Number           guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi String           guifg=#009ba2 guibg=NONE    guisp=NONE    gui=NONE
  hi Visual           guifg=#578fcc guibg=#222532 guisp=NONE    gui=NONE,reverse
  hi markdownError    guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
  finish
endif

hi Bold             guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
hi Conceal          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Directory        guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
hi EndOfBuffer      guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Ignore           guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Italic           guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,italic
hi ModeMsg          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi MoreMsg          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Question         guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi NonText          guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Normal           guifg=#4a5067 guibg=#fceee0 guisp=NONE    gui=NONE
hi Terminal         guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE
hi Title            guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
hi Underlined       guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,underline
hi Comment          guifg=#666c85 guibg=NONE    guisp=NONE    gui=NONE
hi CursorLineNr     guifg=#666c85 guibg=NONE    guisp=NONE    gui=NONE
hi LineNr           guifg=#666c85 guibg=NONE    guisp=NONE    gui=NONE
hi FoldColumn       guifg=#4a5067 guibg=NONE    guisp=NONE    gui=NONE
hi PmenuSel         guifg=#4a5067 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi SignColumn       guifg=#4a5067 guibg=NONE    guisp=NONE    gui=NONE
hi StatusLine       guifg=#4a5067 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi StatusLineTerm   guifg=#4a5067 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi TabLineSel       guifg=#4a5067 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi VisualNOS        guifg=#666c85 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Cursor           guifg=#2d3243 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi IncSearch        guifg=#2d3243 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi ColorColumn      guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi CursorColumn     guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi CursorLine       guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi DiffChange       guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi Folded           guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi MatchParen       guifg=#2d3243 guibg=#bead9d guisp=NONE    gui=NONE
hi Pmenu            guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE
hi QuickFixLine     guifg=NONE    guibg=#ecdac9 guisp=NONE    gui=NONE
hi StatusLineNC     guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE
hi StatusLineTermNC guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE
hi TabLine          guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE
hi ToolbarButton    guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE,bold
hi WildMenu         guifg=#4a5067 guibg=#ecdac9 guisp=NONE    gui=NONE
hi PmenuSbar        guifg=#bead9d guibg=#bead9d guisp=NONE    gui=NONE
hi PmenuThumb       guifg=#4a5067 guibg=#4a5067 guisp=NONE    gui=NONE
hi TabLineFill      guifg=#ecdac9 guibg=#ecdac9 guisp=NONE    gui=NONE
hi ToolbarLine      guifg=#ecdac9 guibg=#ecdac9 guisp=NONE    gui=NONE
hi VertSplit        guifg=#bead9d guibg=#bead9d guisp=NONE    gui=NONE
hi SpellBad         guifg=NONE    guibg=NONE    guisp=#f7003c gui=NONE,undercurl
hi SpellCap         guifg=NONE    guibg=NONE    guisp=#0082ff gui=NONE,undercurl
hi SpellLocal       guifg=NONE    guibg=NONE    guisp=#0093b3 gui=NONE,undercurl
hi SpellRare        guifg=NONE    guibg=NONE    guisp=#c709dd gui=NONE,undercurl
hi StorageClass     guifg=#8b6800 guibg=NONE    guisp=NONE    gui=NONE
hi Structure        guifg=#8b6800 guibg=NONE    guisp=NONE    gui=NONE
hi Type             guifg=#8b6800 guibg=NONE    guisp=NONE    gui=NONE
hi Typedef          guifg=#8b6800 guibg=NONE    guisp=NONE    gui=NONE
hi TooLong          guifg=#a348ae guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi WarningMsg       guifg=#a348ae guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Function         guifg=#006dcc guibg=NONE    guisp=NONE    gui=NONE
hi Identifier       guifg=#006dcc guibg=NONE    guisp=NONE    gui=NONE
hi DiffDelete       guifg=#c6394c guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi DiffRemoved      guifg=#c6394c guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Error            guifg=#c6394c guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi ErrorMsg         guifg=#c6394c guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Debug            guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi Delimiter        guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi Special          guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi SpecialChar      guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi SpecialComment   guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi SpecialKey       guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi Tag              guifg=#c6394c guibg=NONE    guisp=NONE    gui=NONE
hi DiffChanged      guifg=#8b6800 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi DiffText         guifg=#8b6800 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Search           guifg=#ffd506 guibg=#2d3243 guisp=NONE    gui=NONE,reverse
hi Conditional      guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Exception        guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Keyword          guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Label            guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Operator         guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Repeat           guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi Statement        guifg=#007f25 guibg=NONE    guisp=NONE    gui=NONE
hi DiffAdd          guifg=#007f25 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi DiffAdded        guifg=#007f25 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Define           guifg=#a348ae guibg=NONE    guisp=NONE    gui=NONE
hi Include          guifg=#a348ae guibg=NONE    guisp=NONE    gui=NONE
hi Macro            guifg=#a348ae guibg=NONE    guisp=NONE    gui=NONE
hi PreCondit        guifg=#a348ae guibg=NONE    guisp=NONE    gui=NONE
hi PreProc          guifg=#a348ae guibg=NONE    guisp=NONE    gui=NONE
hi Todo             guifg=#007989 guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi Boolean          guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi Character        guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi Constant         guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi Float            guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi Number           guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi String           guifg=#007989 guibg=NONE    guisp=NONE    gui=NONE
hi Visual           guifg=#006dcc guibg=#fceee0 guisp=NONE    gui=NONE,reverse
hi markdownError    guifg=NONE    guibg=NONE    guisp=NONE    gui=NONE,bold
finish
