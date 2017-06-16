" #############################################################################
" PLUGINS
" #############################################################################
" autoload of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'artnez/vim-wipeout'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'coot/vim_args'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dahu/vim-lotr'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'guns/xterm-color-table.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'juneedahamed/vc.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rickhowe/spotdiff.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
call plug#end()

" #############################################################################
" GENERAL SETUP
" #############################################################################
if has('persistent_undo')
if !isdirectory($HOME."/.vim_undo_history")
  call mkdir($HOME."/.vim_undo_history", "", 0700)
endif
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set undodir=~/.vim_undo_history
set undofile
endif
let g:sessionDir = $HOME . "/.vim_sessions"
set nocp
syntax on
filetype plugin indent on
set modeline
set modelines=100

if &term =~ '256color'
	" disable Background Color Erase in 256 color tmux
	" so that colorschemes render correctly
	set t_ut=
endif
setlocal ts=4 sts=4 sw=4 expandtab cindent autoindent smartindent

set listchars=tab:‣\ ,eol:¬,trail:·,precedes:<,extends:>

"EndOfLine Color
highlight NonText ctermfg=darkgrey guifg=#4a4a59
"Tab Color
highlight SpecialKey ctermfg=darkgrey
highlight ExtraWhitespace ctermbg=red ctermfg=yellow guibg=red
match ExtraWhitespace /\s\+$/


if has("autocmd")
  autocmd FileType perl,pl,pm,tmpl call SetPerlOptions()
  autocmd FileType cfg call SetCfgOptions()
  autocmd FileType sh,bash,zsh call SetShellOptions()
  autocmd FileType json call SetJSONOptions()
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType html,php,xhtml,css setlocal ts=4 sts=4 sw=4 expandtab equalprg=tidy\ --show-warnings\ false\ --show-body-only\ true\ -i\ -quiet
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

function! SetPerlOptions()
    setlocal ts=4 sts=4 sw=4 expandtab cindent autoindent smartindent
endfunction
function! SetShellOptions()
  setlocal ts=4 sts=4 sw=4 expandtab cindent autoindent smartindent
endfunction
function! SetJSONOptions()
endfunction
function! SetCfgOptions()
    setlocal ts=4 sts=4 sw=4 expandtab cindent autoindent smartindent
endfunction

colorscheme PaperColor
set backspace=indent,eol,start
set backup
set bg=light
set cursorline
set diffopt=vertical,filler
set encoding=utf-8
set foldcolumn=2
set foldlevel=20
set foldlevelstart=20
set foldmethod=manual
set guifont=Hack\ 14
set helplang=en
set hidden
set history=50
set hlsearch
set incsearch
set keymodel=startsel,stopsel
set laststatus=2
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
set so=10
set spelllang=en,de_20
set tabstop=4
set textwidth=240
set virtualedit=block
set whichwrap=b,s,<,>,[,]
set wildmenu
set wildmode=list:longest
syntax enable

" #############################################################################
" PLUGIN SPECIFIC SETTINGS
" #############################################################################
"NERDTree
let g:NERDTreeWinSize = 60

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --group'
  endif
let g:ackhighlight = 1
let g:ack_autofold_results = 0
let g:ack_qhandler = "botright copen 10"
let g:ack_apply_qmappings=1

" SuperTab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

"CtrlP
let ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:30,results:30'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['lib']
"
" Session Manager
:let g:session_autoload = 'no'

"NERDCommenter
let NERDSpaceDelims=1
set nopaste

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
    let g:undotree_HighlightSyntaxAdd = "DiffAdd"
endif
if !exists('g:undotree_HighlightSyntaxChange')
    let g:undotree_HighlightSyntaxChange = "DiffChange"
endif

"neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#auto_complete_delay = 300
let	g:neocomplete#skip_auto_completion_time = 0.1
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : '',
   \ 'vimshell' : $HOME.'/.vimshell_hist',
   \ 'scheme' : $HOME.'/.gosh_completions'
       \ }
if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

inoremap <expr><silent> <CR> <SID>my_cr_function()
"allow completion at end of line
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() . "\<CR>" : "\<CR>"
endfunction
"Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
let UltiSnipsExpandTrigger = '<f9>'

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
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
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
let g:signify_vcs_list = [ 'git', 'svn' ]

" EnhancedDiff
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
	windo set syn=OFF
endif

"lightline
let g:lightline = {
			\ 'colorscheme': 'PaperColor',
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
	\ 'modified': '%{&modified?"⛁ ❗":"⛁ ✔"}',
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
	\			[ 'filename' ] ],
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
let lotr_position = 'top'
let lotr_winsize  = 17

" On many terminals, <Esc>O (with an uppercase O) is a prefix for several
" keycodes, as a consequence insert above can be slow after having pressed <ESC>
" adjusting timeouts remedies this
set timeout timeoutlen=600 ttimeoutlen=100

"disable automatic continuation of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

"VC
let g:vc_auth_errno=215004
let g:vc_browse_cache_all=1

"tagbar
let g:tagbar_sort=0
let g:tagbar_zoomwidth=0

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
" EasyMotion
highlight link EasyMotionTarget Search
highlight link EasyMotionTarget2First Search
highlight link EasyMotionTarget2Second Search

" #############################################################################
" extended rc file
" #############################################################################
if filereadable($HOME."/.vim/vimrc.keymappings")
  so $HOME/.vim/vimrc.keymappings
endif

