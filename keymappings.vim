let mapleader=","
noremap <C-]> g<C-]>
"ban ex mode
nmap Q <Nop>

"##################################################
" Leader Keys
"##################################################
nmap <leader>l :set list!<CR>
nnoremap <leader>w :StripWhitespace<cr>

"better whitespace, avoid accidental whitespace stripping
unmap <leader>w
nmap <leader>w :let g:better_whitespace_enabled=1<CR>:ToggleWhitespace<CR>

"NERDTree
map <leader>n :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

" display highlight group under cursor
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"CtrlP
nmap <leader>b :Buffers<CR>
nmap <leader>t :BTags<CR>

" horizontal scrolling
map <C-h> 5zh
map <C-l> 5zl
"##############################################################################
" F Keys
"##############################################################################

let g:NumberToggleTrigger="<F2>"
nnoremap <F2> :TestSuite<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :IndentLinesToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :Ack<CR>
if (has('nvim') || v:version >= 800)
    nmap <F8> :TagbarToggle<CR>
endif
let g:UltiSnipsExpandTrigger = '<F9>'
" entfernt Search Highlight
nnoremap <F12> : let @/ = "" <CR>

