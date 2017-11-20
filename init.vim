"enable italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if has('termguicolors')
    set termguicolors
endif
set encoding=utf-8
scriptencoding utf-8
" #############################################################################
" PLUGINS
" #############################################################################
" requires setup as described https://github.com/tweekmonster/nvim-python-doctor/wiki/Advanced:-Using-pyenv
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

" autoload of vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        augroup vimrc_plug_init
          autocmd!
            autocmd VimEnter * PlugInstall | source $MYVIMRC
        augroup END
endif

call plug#begin($HOME.'/.config/nvim/bundle')
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'artnez/vim-wipeout'
Plug 'bronson/vim-visual-star-search'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'chriskempson/base16-vim'
Plug 'coot/vim_args'
Plug 'dahu/vim-lotr'
Plug 'ervandew/supertab'
Plug 'guns/xterm-color-table.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'juneedahamed/vc.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'lifepillar/vim-solarized8'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rickhowe/spotdiff.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'tmhedberg/matchit'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'zeis/vim-kolor'
call plug#end()

" #############################################################################
" GENERAL SETUP
" #############################################################################
if has('persistent_undo')
if !isdirectory($HOME.'/.vim_undo_history')
  call mkdir($HOME.'/.vim_undo_history', '', 0700)
endif
set undolevels=100          " How many undos
set undoreload=1000         " number of lines to save for undo
set undodir=~/.vim_undo_history
set undofile
endif
let g:sessionDir = $HOME . '/.vim_sessions'
syntax on
filetype plugin indent on
set modeline
set modelines=100

if &term =~? '256color'
" disable Background Color Erase in 256 color tmux
" so that colorschemes render correctly
set t_ut=
endif
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent

set listchars=tab:‣\ ,eol:¬,trail:·,precedes:<,extends:>,space:·

"EndOfLine Color
highlight NonText ctermfg=darkgrey guifg=#4a4a59
"Tab Color
highlight SpecialKey ctermfg=darkgrey

if has('autocmd')
  augroup vimrc_filetype_config
      autocmd!
      autocmd FileType perl,pl,pm,tmpl call SetPerlOptions()
      autocmd FileType cfg call SetCfgOptions()
      autocmd FileType sh,bash,zsh call SetShellOptions()
      autocmd FileType json call SetJSONOptions()
      autocmd FileType javascript call SetJSONOptions()
      autocmd BufNewFile,BufReadPost *.md set filetype=markdown
      autocmd FileType make setlocal ts=8 softtabstop=8 shiftwidth=8 expandtab
      autocmd FileType html,php,xhtml,css setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab equalprg=tidy\ --show-warnings\ false\ --show-body-only\ true\ -i\ -quiet
      autocmd BufNewFile,BufRead *.rss setfiletype xml
  augroup END
endif

function! SetPerlOptions()
    setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent
endfunction
function! SetShellOptions()
  setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent
endfunction
function! SetJSONOptions()
  setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent
endfunction
function! SetCfgOptions()
    setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent
endfunction
autocmd Colorscheme * highlight Whitespace ctermfg=239 guifg=#555588
autocmd Colorscheme * highlight NonText ctermfg=239 guifg=#555588
autocmd ColorScheme * highlight Sneak guifg=#333355 guibg=#BBBBDB ctermfg=white ctermbg=green gui=NONE cterm=NONE
set backspace=indent,eol,start
set backup
set cmdwinheight=25
set colorcolumn=125
set cursorline
set diffopt=vertical,filler
set foldcolumn=2
set foldlevel=20
set foldlevelstart=20
set foldmethod=manual
set guifont=Hack\ 14
set helplang=en
set hidden
set history=50
set hlsearch
set ignorecase
set smartcase
set inccommand=split
set incsearch
set keymodel=startsel,stopsel
set laststatus=2
set list
set nocursorcolumn
set nospell
set number
set numberwidth=1
set pastetoggle =<F10>
set previewheight=5
set ruler
set selection=inclusive
set selectmode=key
set shiftwidth=4
set showcmd
set showtabline=1
set scrolloff=10
set spelllang=en,de_20
set tabstop=4
set textwidth=240
set virtualedit=block
set whichwrap=b,s,<,>,[,]
set wildmenu
set wildmode=full
syntax enable

cab Help vert bo help

if &diff
    syntax off
endif

" #############################################################################
" PLUGIN SPECIFIC SETTINGS
" #############################################################################

"test-vim
let g:test#strategy = 'neovim'

"NERDTree
let g:NERDTreeWinSize = 60

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --group'
  endif
let g:ackhighlight = 1
let g:ack_autofold_results = 0
let g:ack_qhandler = 'botright copen 10'
let g:ack_apply_qmappings=1

" SuperTab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

"NERDCommenter
let g:NERDSpaceDelims=1
set nopaste

"deoplete
let g:deoplete#enable_at_startup = 1

"undotree
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif
if !exists('g:undotree_SplitWidth')
    if exists('g:undotree_ShortIndicators')
        let g:undotree_SplitWidth = 24
    else
        let g:undotree_SplitWidth = 30
    endif
endif
let g:undotree_SetFocusWhenToggle = 1
if !exists('g:undotree_DiffpanelHeight')
    let g:undotree_DiffpanelHeight = 10
endif
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif
" Highlight linked syntax type.
" You may chose your favorite through ":hi" command
if !exists('g:undotree_HighlightSyntaxAdd')
    let g:undotree_HighlightSyntaxAdd = 'DiffAdd'
endif
if !exists('g:undotree_HighlightSyntaxChange')
    let g:undotree_HighlightSyntaxChange = 'DiffChange'
endif

"Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'custom-snippets']
let g:UltiSnipsExpandTrigger = '<f9>'

"fzf
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_tags_command = 'ctags -R'
set tags=./tags;/


" signify
let g:signify_vcs_list = ['svn', 'git']
let g:signify_realtime = 0

" EnhancedDiff
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
    windo set syn=OFF
endif

"lightline
let g:lightline = {
            \ 'colorscheme': 'onehalfdark',
            \ 'component': {
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
let g:lightline.component = {
    \ 'mode': '%{lightline#mode()}',
    \ 'absolutepath': '%F',
    \ 'relativepath': '%f',
    \ 'filename': '%t',
    \ 'modified': '%{&modified?"!":" "}',
    \ 'bufnum': '%n',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%{&readonly?"":""}',
    \ 'charvalue': '%b',
    \ 'charvaluehex': '%B',
    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
    \ 'fileformat': '%{&ff}',
    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
    \ 'percent': '%3p%%',
    \ 'percentwin': '%P',
    \ 'spell': '%{&spell?&spelllang:""}',
    \ 'lineinfo': '%3l:%-2v',
    \ 'line': '%l',
    \ 'column': '%c',
    \ 'path' : '%{expand("%:h")}/',
    \ 'close': '%999X X ' }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'path'],
    \            [ 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'modified', 'readonly', 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ [ 'readonly', 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

" LOTR
let g:lotr_position = 'top'
let g:lotr_winsize  = 17

" On many terminals, <Esc>O (with an uppercase O) is a prefix for several
" keycodes, as a consequence insert above can be slow after having pressed <ESC>
" adjusting timeouts remedies this
set timeout timeoutlen=600 ttimeoutlen=100

" highlightedyank
let g:highlightedyank_highlight_duration=500

"disable automatic continuation of comments
augroup vimrc
  autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

"VC
set shell=/bin/bash
let g:vc_auth_errno=215004
let g:vc_browse_cache_all=1

"tagbar
let g:tagbar_sort=0
let g:tagbar_zoomwidth=0

"sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

"ale
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 400
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format='%linter%: %s (%severity%)'

"signature
let g:SignatureMarkTextHL='None'

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
" colorscheme gruvbox
colorscheme onehalfdark
" set background=dark
" colorscheme solarized8_dark
" colorscheme base16-onedark
" #############################################################################
" extended colorscheme
" #############################################################################
" template toolkit
hi def link ttKeywords Statement
highlight link ttTagRegion Identifier
hi ttOperators ctermfg=darkblue
hi ttIdentifier ctermfg=lightgray
" ctrlp
highlight link CtrlPMatch Search
" tagbar
hi TagbarHighlight ctermbg=darkgreen ctermfg=black
" onehalf tweaks
highlight PMenuSel none
highlight link PMenuSel Visual
hi! link IncSearch PMenu
" #############################################################################
" extended rc file
" #############################################################################
if filereadable($HOME.'/.config/nvim/init.vim.keymappings')
  so $HOME/.config/nvim/init.vim.keymappings
endif

