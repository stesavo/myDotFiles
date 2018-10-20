" ==============================================================================
"   Name:        ToyStore
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

let s:primary_dark            = { "gui": "#003926", "cterm": "235" }
let s:primary_semi_dark       = { "gui": "#004730", "cterm": "237"}
let s:primary                 = { "gui": "#277159", "cterm": "239"}
let s:primary_semi_bright     = { "gui": "#5B907F", "cterm": "241"}
let s:primary_bright          = { "gui": "#9CABA6", "cterm": "243"}

let s:secondary_1_dark        = { "gui": "#1D013A", "cterm": "128"}
let s:secondary_1_semi_dark   = { "gui": "#250448", "cterm": "134"}
let s:secondary_1             = { "gui": "#4F2D73", "cterm": "140"}
let s:secondary_1_semi_bright = { "gui": "#796192", "cterm": "146"}
let s:secondary_1_bright      = { "gui": "#A6A0AE", "cterm": "152"}

let s:secondary_2_dark        = { "gui": "#565000", "cterm": "196"}
let s:secondary_2_semi_dark   = { "gui": "#6B6300", "cterm": "202"}
let s:secondary_2             = { "gui": "#AAA23A", "cterm": "208"}
let s:secondary_2_semi_bright = { "gui": "#D9D389", "cterm": "214"}
let s:secondary_2_bright      = { "gui": "#FFFEE9", "cterm": "220"}

let s:complement_dark         = { "gui": "#561D00", "cterm": "197"}
let s:complement_semi_dark    = { "gui": "#6B2400", "cterm": "203"}
let s:complement              = { "gui": "#AA603A", "cterm": "209"}
let s:complement_semi_bright  = { "gui": "#D9A489", "cterm": "215"}
let s:complement_bright       = { "gui": "#FFF0E9", "cterm": "221"}


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

call s:h("Cursor", s:complement, s:complement_bright, "")
call s:h("CursorColumn", "", s:primary_semi_dark, "")
call s:h("CursorLine", "", s:primary_semi_dark, "")

call s:h("LineNr", s:primary, s:primary_dark, "")
call s:h("CursorLineNr", s:primary_bright, "", "")

call s:h("DiffAdd", s:primary_bright, "", "")
call s:h("DiffChange", s:secondary_2_semi_bright, "", "")
call s:h("DiffDelete", s:complement_semi_bright, "", "")
call s:h("DiffText", s:secondary_1_semi_bright, "", "")

call s:h("IncSearch", s:complement_bright, s:complement, "bold")
call s:h("Search", s:primary_bright, s:complement, "bold")


call s:h("ErrorMsg", s:complement_bright, s:complement_dark, "")
call s:h("ModeMsg", s:primary_bright, "", "")
call s:h("MoreMsg", s:primary_bright, "", "")
call s:h("WarningMsg", s:secondary_2_semi_bright, s:complement_semi_dark, "")
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
call s:h("TabLineSel", s:primary_semi_dark, s:primary, "")

call s:h("Visual", s:primary_bright, s:primary_semi_dark, "")
call s:h("VisualNOS", "", s:primary_semi_dark, "")

call s:h("ColorColumn", "", s:primary_semi_dark, "")
 call s:h("Conceal", "", "", "")
call s:h("Directory", s:secondary_2, "", "")
call s:h("VertSplit", s:primary_semi_dark, s:primary, "")
call s:h("Folded", s:complement_semi_bright, s:complement, "")
call s:h("FoldColumn", s:primary, s:primary_dark, "")
call s:h("SignColumn", s:complement_semi_bright, s:primary_dark, "bold")

call s:h("MatchParen", "", "", "underline")
call s:h("SpecialKey", s:primary_semi_bright, "", "")
call s:h("Title", s:primary_bright, "", "bold")
call s:h("WildMenu", s:secondary_2_dark, s:secondary_2, "")
