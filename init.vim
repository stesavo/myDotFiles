scriptencoding utf-8
if (has('nvim'))
    let s:vimBaseDir = $HOME.'/.config/nvim/'
else
    let s:vimBaseDir = $HOME.'/.vim/'
endif
" #############################################################################
" USE EXTENDED TERMINAL CAPABILITIES
" #############################################################################
"enable italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    if has('termguicolors')
        set termguicolors
    endif
endif

" #############################################################################
" GENERAL OPTIONS
" #############################################################################
set backspace=indent,eol,start
set backup
set cmdwinheight=25
set cursorline
set diffopt=vertical,filler
set encoding=utf-8
set foldcolumn=2
set foldlevel=20
set foldlevelstart=20
set foldmethod=manual
set guicursor=
set guifont=Hack\ 14
set helplang=en
set hidden
set history=50
set hlsearch
if (has('nvim'))
    set inccommand=split
endif
set ignorecase
set incsearch
set keymodel=startsel,stopsel
set laststatus=2
set nolist
if (has('nvim') || v:version >= 800)
    set listchars=tab:‣\ ,eol:¬,trail:·,precedes:<,extends:>,space:·
else
    set listchars=tab:‣\ ,eol:¬,trail:·,precedes:<,extends:>
endif
set modeline
set modelines=100
set nocursorcolumn
set nospell
set number
set numberwidth=1
set pastetoggle=<F10>
set previewheight=5
set ruler
set scrolloff=10
set selection=inclusive
set selectmode=key
set shiftwidth=4
set showcmd
set showtabline=1
set smartcase
set spelllang=en,de_20
set tabstop=4
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent autoindent smartindent
set textwidth=240
set updatetime=500
set virtualedit=block
set whichwrap=b,s,<,>,[,]
set wildmenu
set wildmode=longest,list,full

" #############################################################################
" CONDITIONAL OPTIONS
" #############################################################################
if has('persistent_undo')
    if !isdirectory(s:vimBaseDir.'undo_history')
        call mkdir(s:vimBaseDir.'undo_history', '', 0700)
    endif
    set undolevels=100          " How many undos
    set undoreload=1000         " number of lines to save for undo
    set undodir=~/.vim_undo_history
    set undofile
endif

" #############################################################################
" SETUP & CUSTOMIZATION
" #############################################################################
filetype plugin indent on
let g:sessionDir = s:vimBaseDir.'/.vim_sessions'
cab Help vert bo help
syntax enable
" keep the cursor from jumping to next hit when pressing *
nmap <silent> * "syiw<Esc>: let @/ = @s<CR>nN

" #############################################################################
" EXTENDED RC FILE
" #############################################################################
if filereadable(s:vimBaseDir . 'keymappings.vim')
  execute 'source ' . s:vimBaseDir . 'keymappings.vim'
endif
if filereadable(s:vimBaseDir . 'init.vim.dbprofiles')
  execute 'source ' . s:vimBaseDir . 'init.vim.dbprofiles'
endif

" #############################################################################
" PLUGINS
" #############################################################################
if (executable('git') && executable('curl'))
    " requires setup as described https://github.com/tweekmonster/nvim-python-doctor/wiki/Advanced:-Using-pyenv
    let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

    " autoload of vim-plug
    if empty(glob(s:vimBaseDir.'autoload/plug.vim'))
          execute '!curl -fLo ' . s:vimBaseDir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            augroup vimrc_plug_init
              autocmd!
                autocmd VimEnter * PlugInstall | source $MYVIMRC
            augroup END
    endif
    call plug#begin(s:vimBaseDir.'plugins_vim-plug')
    if (has('nvim') || v:version >= 800)
        Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
        Plug 'NLKNguyen/papercolor-theme'
        if (has('nvim') && has('python3') && has('timers'))
            Plug 'Shougo/neco-syntax'
            Plug 'Shougo/neco-vim'
            Plug 'Shougo/deoplete.nvim', {'tag': '4.0'}
        endif
    endif
    if (has('nvim') || v:version >= 800)
        Plug 'SirVer/ultisnips'
    endif
    Plug 'alcesleo/vim-uppercase-sql'
    Plug 'artnez/vim-wipeout'
    Plug 'bronson/vim-visual-star-search'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'coot/vim_args'
    Plug 'dahu/vim-lotr'
    Plug 'ervandew/supertab'
    Plug 'guns/xterm-color-table.vim'
    Plug 'honza/vim-snippets'
    Plug 'janko-m/vim-test'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'juneedahamed/vc.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'justinmk/vim-sneak'
    if (has('signs'))
        Plug 'kshenoy/vim-signature'
    endif
    Plug 'lifepillar/vim-solarized8'
    Plug 'machakann/vim-highlightedyank'
    if (has('nvim') || v:version >= 800)
        Plug 'majutsushi/tagbar'
    endif
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-signify'
    if (executable('ag'))
        Plug 'mileszs/ack.vim'
    endif
    Plug 'moll/vim-bbye'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'stesavo/dbext.vim'
    if (has('nvim') || v:version >= 800)
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
    endif
    if (has('nvim') || v:version >= 800)
        Plug 'w0rp/ale'
    endif
    Plug 'wellle/tmux-complete.vim'
    Plug 'will133/vim-dirdiff'
    Plug 'Yggdroot/indentLine'
    call plug#end()

    " #############################################################################
    " PLUGIN SPECIFIC SETTINGS
    " #############################################################################

    "test-vim
    let g:test#strategy = 'neovim'

    "NERDTree
    let g:NERDTreeWinSize = 60

    " Ack
    if executable('rg')
        let g:ackprg = 'rg --vimgrep --smart-case --heading --ignore-file ~/.config/git/ignore'
        let g:ackhighlight = 1
        let g:ack_autofold_results = 0
        let g:ack_qhandler = 'botright copen 10'
        let g:ack_apply_qmappings=1
    elseif executable('ag')
        let g:ackprg = 'ag --vimgrep --group'
        let g:ackhighlight = 1
        let g:ack_autofold_results = 0
        let g:ack_qhandler = 'botright copen 10'
        let g:ack_apply_qmappings=1
    endif

    " SuperTab
    let g:SuperTabMappingForward = '<s-tab>'
    let g:SuperTabMappingBackward = '<tab>'

    "NERDCommenter
    let g:NERDSpaceDelims=1
    set nopaste

    "deoplete
    if (has('python3') && has('timers'))
        let g:deoplete#enable_at_startup = 1
    endif

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
    if !exists('g:undotree_HighlightSyntaxDel')
        let g:undotree_HighlightSyntaxDel = "DiffDelete"
    endif

    "Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor
    endif

    " UltiSnips
    let g:UltiSnipsSnippetDirectories=['UltiSnips', 'custom-snippets']

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


    " signify
    let g:signify_vcs_list = ['svn', 'git']
    let g:signify_realtime = 0

    " LOTR
    let g:lotr_position = 'top'
    let g:lotr_winsize  = 17

    " On many terminals, <Esc>O (with an uppercase O) is a prefix for several
    " keycodes, as a consequence insert above can be slow after having pressed <ESC>
    " adjusting timeouts remedies this
    set timeout timeoutlen=600 ttimeoutlen=0

    " highlightedyank
    let g:highlightedyank_highlight_duration=300

    "disable automatic continuation of comments
    augroup vimrc
      autocmd!
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    augroup END

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
    let g:ale_enabled = 0
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_lint_on_save = 1
    let g:ale_lint_delay = 400
    let g:ale_sign_column_always = 1
    let g:ale_echo_msg_format='%linter%: %s (%severity%)'

    "signature
    if (has('signs'))
        let g:SignatureMarkTextHL='None'
    endif

    "LanguageClient

    "IndentLine
    let g:indentLine_enabled = 0
    let g:indentLine_setColors = 0

    "BetterWhitespace and list chars on diff
    if (!&diff)
        let g:better_whitespace_enabled = 0
    else
        set list
    endif
endif

"airline
let g:airline_powerline_fonts                  = 1
let g:airline_theme                            = 'tomorrow'
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#show_buffers  = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter     = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'

" #############################################################################
" COLOR SCHEME (should come after plugin section in case a colorscheme
"               is loaded as a plugin)
" #############################################################################
autocmd ColorScheme * highlight Sneak guifg=#333355 guibg=#BBBBDB ctermfg=white ctermbg=green gui=NONE cterm=NONE
autocmd ColorScheme * highlight SneakLabel guifg=#333355 guibg=#BBBBDB ctermfg=white ctermbg=green gui=NONE cterm=NONE
autocmd ColorScheme * highlight SneakScope guifg=black guibg=white ctermfg=white ctermbg=green gui=NONE cterm=NONE

    if (v:version >= 800 && len(getcompletion('proton', 'color')) == 1)
        colorscheme proton
    else
        colorscheme slate
        set nocursorline
    endif

if (!has('nvim') && v:version < 800)
" #############################################################################
"   STATUS LINE
" #############################################################################
    set statusline=
    set statusline+=\[%n]                                  "buffernr
    set statusline+=%{expand('%:h')}/                      "directory of file
    set statusline+=\%#StatusLineFilename#%t%*\            "Filename
    set statusline+=\ %y\                                  "FileType
    set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
    set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..)
    set statusline+=\ %=\ row:%l/%L                        "Rownumber/total (%)
    set statusline+=\ col:%03c\                            "Colnr
    set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
endif
