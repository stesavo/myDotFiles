" ==============================================================================
"   Name:        Proton
"   Author:      Stefan Savolainen
"   URL:         github.com/stesavo/toystore
"   License:     The MIT License (MIT)
"
" ==============================================================================

set background=dark
highlight clear
syntax reset

let g:colors_name="proton"
let colors_name="proton"

let s:primary_dark            = { "gui": "#003926", "cterm": "235"}
let s:primary_semi_dark       = { "gui": "#004730", "cterm": "237"}
let s:primary                 = { "gui": "#277159", "cterm": "239"}
let s:primary_semi_bright     = { "gui": "#5B907F", "cterm": "243"}
let s:primary_bright          = { "gui": "#9CABA6", "cterm": "247"}

let s:secondary_1_dark        = { "gui": "#080D3B", "cterm": "128"}
let s:secondary_1_semi_dark   = { "gui": "#191F58", "cterm": "134"}
let s:secondary_1             = { "gui": "#525495", "cterm": "140"}
let s:secondary_1_semi_bright = { "gui": "#7379B3", "cterm": "146"}
let s:secondary_1_bright      = { "gui": "#8D92C0", "cterm": "152"}

let s:secondary_2_dark        = { "gui": "#565000", "cterm": "196"}
let s:secondary_2_semi_dark   = { "gui": "#6B6300", "cterm": "202"}
let s:secondary_2             = { "gui": "#AAA23A", "cterm": "208"}
let s:secondary_2_semi_bright = { "gui": "#D9D389", "cterm": "214"}
let s:secondary_2_bright      = { "gui": "#FFFEE9", "cterm": "220"}

let s:complement_dark         = { "gui": "#561D00", "cterm": "197"}
let s:complement_semi_dark    = { "gui": "#8c2e00", "cterm": "203"}
let s:complement              = { "gui": "#AA603A", "cterm": "209"}
let s:complement_semi_bright  = { "gui": "#D9A489", "cterm": "215"}
let s:complement_bright       = { "gui": "#FFF0E9", "cterm": "221"}

let s:black                   = { "gui": "#0b1e18", "cterm": "236" }
let s:red                     = { "gui": "#e06c75", "cterm": "168" }
let s:green                   = { "gui": "#98c379", "cterm": "114" }
let s:yellow                  = { "gui": "#e5c07b", "cterm": "180" }
let s:blue                    = { "gui": "#61afef", "cterm": "75"  }
let s:purple                  = { "gui": "#c678dd", "cterm": "176" }
let s:cyan                    = { "gui": "#56b6c2", "cterm": "73"  }
let s:white                   = { "gui": "#bcbfc4", "cterm": "188" }

function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun


" User interface colors {
call s:h("Normal", s:primary_semi_bright, s:primary_dark, "")
call s:h("NonText", s:complement, "", "")
call s:h("ExtraWhitespace", "", s:complement, "")

call s:h("Cursor", s:complement, s:complement_bright, "")
call s:h("CursorColumn", "", s:primary_semi_dark, "")
call s:h("CursorLine", "", s:primary_semi_dark, "")

call s:h("LineNr", s:primary, s:primary_dark, "")
call s:h("CursorLineNr", s:primary_bright, "", "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", "", "", "")
call s:h("DiffDelete", s:primary_dark, s:black, "bold")
call s:h("DiffText", s:yellow, "", "")

call s:h("IncSearch", s:complement_bright, s:complement, "bold")
call s:h("Search", s:primary_bright, s:complement, "bold")


call s:h("ErrorMsg", s:complement_dark, s:complement_bright, "")
call s:h("ModeMsg", s:primary_bright, "", "")
call s:h("MoreMsg", s:primary_bright, "", "")
call s:h("WarningMsg", s:secondary_2, s:primary_dark, "")
call s:h("Question", s:primary_bright, "", "")

call s:h("Pmenu", s:primary_semi_dark, s:primary_bright, "")
call s:h("PmenuSel", s:primary_bright, s:primary, "")
call s:h("PmenuSbar", s:primary, s:primary_semi_bright, "")
call s:h("PmenuThumb", "", s:primary_semi_dark, "")

call s:h("SpellBad", "", "", "underline")
call s:h("SpellCap", "", "", "underline")
call s:h("SpellLocal", "", "", "underline")
call s:h("SpellRare", "", "", "underline")

call s:h("StatusLine", s:primary_semi_dark, s:primary_semi_bright, "")
call s:h("StatusLineNC", s:primary_semi_dark, s:primary, "")
call s:h("TabLine", s:primary_semi_dark, s:primary, "")
call s:h("TabLineFill", s:primary_semi_dark, s:primary, "")
call s:h("TabLineSel", s:primary_semi_dark, s:primary_bright, "")

call s:h("Visual", s:white, s:secondary_2_semi_dark, "")
call s:h("VisualNOS", "", s:primary_semi_dark, "")

call s:h("ColorColumn", "", s:primary_semi_dark, "")
call s:h("Conceal", "", "", "")
call s:h("Directory", s:secondary_2, "", "")
call s:h("VertSplit", s:primary_semi_dark, s:primary, "")
call s:h("Folded", s:secondary_1_dark, s:secondary_1, "")
call s:h("FoldColumn", s:primary, s:primary_dark, "")
call s:h("SignColumn", s:complement_semi_bright, s:primary_dark, "bold")

call s:h("MatchParen", "", "", "underline")
call s:h("SpecialKey", s:primary_semi_bright, "", "")
call s:h("Title", s:primary_bright, "", "bold")
call s:h("WildMenu", s:secondary_2_dark, s:secondary_2, "")

" Syntax colors {
call s:h("Comment", s:primary, s:primary_dark, "")
call s:h("Constant", s:primary_semi_bright, s:primary_dark, "bold")
call s:h("String", s:primary_bright, s:primary_dark, "")
call s:h("Character", s:primary_semi_bright, s:primary_dark, "")
call s:h("Number", s:primary_bright, s:primary_dark, "")
call s:h("Boolean", s:primary_semi_bright, s:primary_dark, "")
call s:h("Float", s:primary_semi_bright, s:primary_dark, "")

call s:h("Identifier", s:white, s:primary_dark, "")
call s:h("Function", s:secondary_2, s:primary_dark, "")
call s:h("Statement", s:secondary_2, s:primary_dark, "italic,bold")

" call s:h("Conditional", s:primary_semi_bright, s:primary_dark, "")
call s:h("Repeat", s:primary_semi_bright, s:primary_dark, "")
call s:h("Label", s:primary_semi_bright, s:primary_dark, "")
call s:h("Operator", s:secondary_2, s:primary_dark, "italic")
" call s:h("Keyword", s:secondary_2, s:primary_dark, "")
call s:h("Exception", s:primary_semi_bright, s:primary_dark, "")

call s:h("PreProc", s:secondary_2, s:primary_dark, "")
call s:h("Include", s:primary_semi_bright, s:primary_dark, "")
call s:h("Define", s:primary_semi_bright, s:primary_dark, "")
call s:h("Macro", s:primary_semi_bright, s:primary_dark, "")
call s:h("PreCondit", s:primary_semi_bright, s:primary_dark, "")

call s:h("Type", s:secondary_1_bright, s:primary_dark, "bold")
call s:h("Structure", s:primary_semi_bright, s:primary_dark, "")
call s:h("Typedef", s:primary_semi_bright, s:primary_dark, "")

call s:h("Special", s:secondary_1_semi_bright, s:primary_dark, "bold")
call s:h("SpecialChar", s:primary_semi_bright, s:primary_dark, "")
call s:h("Tag", s:primary_semi_bright, s:primary_dark, "")
call s:h("Delimiter", s:secondary_1_bright, s:primary_dark, "bold")
call s:h("SpecialComment", s:primary_semi_bright, s:primary_dark, "")
call s:h("Debug", s:primary_semi_bright, s:primary_dark, "")
call s:h("Underlined", s:primary_semi_bright, s:primary_dark, "")
call s:h("Ignore", s:primary_semi_bright, s:primary_dark, "")
call s:h("Error", s:primary_semi_bright, s:primary_dark, "")
call s:h("Todo", s:primary_semi_bright, s:primary_dark, "")


call s:h("ttTagRegion", s:primary, "", "bold")
call s:h("ttKeywords", s:primary, "", "bold")
call s:h("ttIdentifier", s:primary, "", "")
call s:h("ttOperators", s:primary, "", "")

"links
hi link StorageClass Statement
hi link jsVariableDef Identifier
hi link Conditional Statement
hi link Keyword Type
