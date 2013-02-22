" BASICS
call pathogen#infect()
syntax enable
set nocompatible
set encoding=utf-8
set hidden
filetype plugin indent on
let mapleader = ","
set directory=/tmp


" VIEWPORT
set showcmd
set ruler
" set number
" set background=dark
if has("gui_running")
  color hemisu
else
 if has("win32")
  color hemisu
 else
  set t_Co=256
  color hemisu
 endif
endif
autocmd FileType html colorscheme hemisu


" WHITESPACE
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
" set colorcolumn=80


" MOVEMENT
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set whichwrap+=<,>,h,l,[,]    " movement keys wrap to nextlines


" SEARCHING
set hlsearch
set incsearch
set ignorecase
set smartcase


" FORMATTING
set pastetoggle=<F6>

" destroy whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" list buffers, number to select
:nnoremap <F4> :buffers<CR>:buffer<Space>


" LANG SPECIFICS
autocmd BufEnter *.py  set et ts=4 sts=4 sw=4
autocmd BufLeave *.py  set et ts=2 sts=2 sw=2
au BufNewFile,BufRead *.scss set filetype=css
au BufNewFile,BufRead *.eco set filetype=html


" STUFF
set list listchars=tab:>.,trail:.,extends:$,precedes:<      " paint the shame
map <leader>cd :cd %:p:h<cr>                                " cd to dir of buffer's file

map <silent> <Leader>cx :set cursorcolumn! <CR>
imap <silent> <Leader>cx <Esc>:set cursorcolumn! <CR>a

" toggle colored right border after 80 chars
set colorcolumn=80
let s:color_column_old = 0

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap <Leader>cc :call <SID>ToggleColorColumn()<cr>


" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/markdown --html4tags <cr>
