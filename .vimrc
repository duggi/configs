" call pathogen#infect()

" ----- VUNDLE

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'godlygeek/tabular'

filetype plugin indent on


" ----- STUFF

syntax enable
set encoding=utf-8
"set clipboard=unnamed
set hidden
let mapleader = ","
set directory=/tmp
set laststatus=2
set visualbell
nmap <Up> gk
nmap <Down> gj



" ----- F KEYS

nnoremap  <F2> :set nonumber!<CR>
:map      <F3> :set nowrap! <CR>
:nnoremap <F4> :buffers<CR>:buffer<Space>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set pastetoggle=<F6>
:map <F7> :noh <CR>
:nnoremap <F8> "=strftime("%c")<CR>P
:inoremap <F8> <C-R>=strftime("%c")<CR>
nmap <F9> :CtrlPClearAllCaches<CR>



" ----- VIEWPORT

set showcmd
set ruler
" set number
set background=dark
if has("gui_running")
  color gruvbox
else
  if has("win32")
    color gruvbox
  else
    set t_Co=256
    color gruvbox
  endif
endif
autocmd FileType html colorscheme gruvbox

" -- set pencil light
"    TODO make it a toggle to dark theme
function! LightTheme()
  colorscheme pencil
  set background=light
endfunction
nmap <Leader>l :call LightTheme()<CR>



" ----- CURSOR

set guicursor+=a:blinkon0
hi Cursor guifg=red guibg=yellow



" ----- WHITESPACE

"set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start



" ----- MOVEMENT

inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set whichwrap+=<,>,h,l,[,]    " movement keys wrap to nextlines
set iskeyword-=_              " cw respects underscores

:map <C-J> :bnext <CR>
:map <C-K> :bprev <CR>
":map <A-up> :bnext <CR>
":map <A-down> :bprev <CR>
:map <C-H> :wincmd h<CR>
:map <C-L> :wincmd l<CR>



" -----SEARCHING

set hlsearch
set incsearch
set ignorecase
set smartcase



" ----- LANG SPECIFICS

autocmd BufEnter *.py  set et ts=4 sts=4 sw=4
autocmd BufLeave *.py  set et ts=2 sts=2 sw=2
au BufNewFile,BufRead *.scss set filetype=scss
au BufNewFile,BufRead *.eco set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html

au BufNewFile,BufRead *.sass set filetype=haml
au BufNewFile,BufRead *.jade set filetype=haml


" ----- STUFF

set list listchars=tab:>.,trail:.,extends:$,precedes:<
map <leader>cd :cd %:p:h<cr>
"map <leader>m :MiniBufExplorer<cr>

map <silent> <Leader>cx :set cursorcolumn! <CR>
imap <silent> <Leader>cx <Esc>:set cursorcolumn! <CR>a


"set colorcolumn=80
"let s:color_column_old = 0
function! s:ToggleColorColumn()
  set colorcolumn=80
  if s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    windo let &colorcolumn = 0
  else
    windo let &colorcolumn=s:color_column_old
    let s:color_column_old = 0
  endif
endfunction
"nnoremap <Leader>cc :call <SID>ToggleColorColumn()<cr>


" -- toggle cursorline
:nnoremap <Leader>cl :set cursorline!<CR>

" -- change up to semicolon. hi css :)
:nnoremap <Leader>; ct;


" -- toggle colorcolumn (single window)
function! ColorColumn()
  if empty(&colorcolumn)
    if empty(&textwidth)
      echo "colorcolumn=80"
      setlocal colorcolumn=80
    else
      echo "colorcolumn=+1 (" . (&textwidth + 1) . ")"
      setlocal colorcolumn=+1
    endif
  else
    echo "colorcolumn="
    setlocal colorcolumn=
  endif
endfunction
nmap <Leader>cc :call ColorColumn()<CR>


" -- markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>


" -- supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "context"


" -- 70 COL LINE SPER
"let @q = 'i69i='
"let @w = 'i69i='
let @q = '€k8o69i=o'
Bundle 'wakatime/vim-wakatime'



" -- inserts timestamp + 70 col separator
let @p = 'O€ku@q'


" -- convert 4 spaces to 2
"let @r=':set €ýc€ýb€ýc€ýbtabstop=2:setexpandtab!€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl :retab!:%s/\t\t/\t/g:set expandtab:retab'

let @r=':set tabstop=2:set expandtab!:retab!:%s/\t\t/\t/g:set expandtab:retab'


" ----- MINIBUFEXPLORER
"source ~/.vim/bundle/minibufexpl.vim
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1
"
"hi MBENormal guifg=#999999 ctermfg=red
"hi MBEChanged guibg=darkblue ctermbg=darkblue guifg=yellow ctermfg=yellow
"hi MBEVisibleNormal guibg=darkblue guifg=black ctermbg=darkblue ctermfg=black
"hi MBEVisibleChanged guibg=darkblue guifg=red ctermbg=darkblue ctermfg=red

