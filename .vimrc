set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
syntax enable
set encoding=utf-8
"set clipboard=unnamed
set hidden
set directory=/tmp
set laststatus=2
set visualbell
nmap <Up> gk
nmap <Down> gj


"
" ----- VUNDLE
"       :PluginInstall
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'
"
" Plugins
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'jlanzarotta/bufexplorer'

Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'godlygeek/tabular'

"Plugin 'ervandew/supertab'
"Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on
" ----- END VUNDLE


"
" ----- LEADER MAPPINGS
"
let mapleader = ","

" nerdtree
nnoremap <Leader>l :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>; :NERDTreeFind<CR>
"
" themes
nmap <Leader>t :call LightTheme()<CR>
nmap <Leader>d :call DarkTheme()<CR>

" cursor hud
nnoremap <Leader>cca :call <SID>ToggleColorColumnAll()<cr>
nmap <Leader>cc :call ToggleColorColumnActive()<CR>
:nnoremap <Leader>cx :set cursorline!<CR>
map <Leader>cz :set cursorcolumn! <CR>
imap <Leader>cz <Esc>:set cursorcolumn! <CR>a

" change directory
map <leader>cd :cd %:p:h<cr>


" markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

" change up to semicolon. hi css :) // WTF?
":nnoremap <Leader>; ct;


"
" ----- F KEYS
"
nnoremap  <F2> :set nonumber!<CR>
:map      <F3> :set nowrap! <CR>
:nnoremap <F4> :buffers<CR>:buffer<Space>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"set pastetoggle=<F6>
:map <F7> :noh <CR>
:nnoremap <F8> "=strftime("%c")<CR>P
:inoremap <F8> <C-R>=strftime("%c")<CR>
nmap <F9> :CtrlPClearAllCaches<CR>
noremap <silent> <F10> :let @+=expand("%:p")<CR>





" ----- NERDTREE
" close NT if file opened from there
"let NERDTreeQuitOnOpen = 1

" close tab if only NT left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



" ----- VIEWPORT
set showcmd
set ruler
set number
set background=dark
set guifont=Ubuntu\ Mono:h15
if has("gui_running")
  color codeschool
else
  if has("win32")
    color codeschool
  else
    "set t_Co=256
    color codeschool
  endif
endif
autocmd FileType html colorscheme codeschool

" -- set pencil light theme
"    TODO make it a toggle to dark theme
function! LightTheme()
  color pencil
  set background=light
endfunction

" -- set pencil dark theme
"    TODO make it a toggle to dark theme
function! DarkTheme()
  color codeschool
  set background=dark
endfunction


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



" ----- CURSOR HUD
" -- toggle colorcolumn all windows
"set colorcolumn=80
let s:color_column_old = 0
function! s:ToggleColorColumnAll()
  set colorcolumn=80
  if s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    windo let &colorcolumn = 0
  else
    windo let &colorcolumn=s:color_column_old
    let s:color_column_old = 0
  endif
endfunction

" -- toggle colorcolumn single window
function! ToggleColorColumnActive()
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



" ----- STUFF
set list listchars=tab:>.,trail:.,extends:$,precedes:<





" -- ctrl p
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_user_command = 'find %s -type f | grep -v -P "\.jpg$|/tmp/"'


" -- supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "context"


" -- nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" -- 70 COL LINE SPER
"let @q = 'i69i='
"let @w = 'i69i='
let @q = '€k8o69i=o'



" -- inserts timestamp + 70 col separator
let @p = 'O€ku@q'

" -- inserts 70 col separator
let @w = 'o=vy80pxo'

" -- convert 4 spaces to 2
"let @r=':set €ýc€ýb€ýc€ýbtabstop=2:setexpandtab!€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl :retab!:%s/\t\t/\t/g:set expandtab:retab'
let @r = ':set tabstop=2:set expandtab!:retab!:%s/\t\t/\t/g:set expandtab:retab'

" -- insert line above/below in command mode
let @a = 'Oj'
let @b = 'ok'

"-- linebreak at cursor in command mode
let @l = 'i'


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
