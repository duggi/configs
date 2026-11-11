filetype off
set rtp+=~/.vim/bundle/Vundle.vim
syntax enable
set encoding=utf-8
"set clipboard=unnamed
set hidden

set directory=~/.vim/swap//
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

set laststatus=2                          " always show
set statusline+=[\%n]                     " buffer number
set statusline+=\ %f                      " filename
set statusline+=%=%-14(%l,%c%V\ (%L)%)    " line, character
set visualbell
set shortmess-=S
nmap <Up> gk
nmap <Down> gj


"
" ----- VUNDLE
" `:PluginInstall` to run
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
Plugin 'jlanzarotta/bufexplorer'
Plugin 'moll/vim-bbye'

Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'godlygeek/tabular'

Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

"Plugin 'SirVer/ultisnips'
"Plugin 'mlaursen/vim-react-snippets'
"Plugin 'ervandew/supertab'
"Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on
" ----- END VUNDLE



"
" ----- COMMANDS
"
command AA bp | sp | bn | bd


"
" ----- F KEYS
"
" toggle line numbers
nnoremap <F2> :set nonumber!<CR>

" toggle visual wrap
:map <F3> :set nowrap! <CR>

" display buffers
:nnoremap <F4> :buffers<CR>:buffer<Space>

" remove trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"set pastetoggle=<F6>

" clear highlighting
nnoremap <silent> <F7> :highlight clear ERROR<CR>

" timestamp
:nnoremap <F8> "=strftime("%Y-%m-%d / %b %d %Y %H:%M %p")<CR>P
:inoremap <F8> <C-R>=strftime("%Y-%m-%d / %b %d %Y %H:%M %p")<CR>

" ctrlp
nmap <F9> :CtrlPClearAllCaches<CR>

" copy current file's full path to clipboard
noremap <silent> <F10> :let @+=expand("%:p")<CR>



"
" ----- LEADER MAPPINGS
"
let mapleader = ","

" nerdtree
nnoremap <Leader>l :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>; :NERDTreeFind<CR>

nnoremap <Leader>bdd :Bdelete<CR>
nnoremap <Leader>bd :bp \| bd #<CR>

" themes
nmap <Leader>t :call LightTheme()<CR>
nmap <Leader>d :call DarkTheme()<CR>

" cursor hud
nnoremap <Leader>cc :call <SID>ToggleColorColumnAll()<cr>
nmap <Leader>cca :call ToggleColorColumnActive()<CR>
:nnoremap <Leader>cx :set cursorline!<CR>
map <Leader>cz :set cursorcolumn! <CR>
imap <Leader>cz <Esc>:set cursorcolumn! <CR>a

" change directory
map <leader>cd :cd %:p:h<cr>

" markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>



" close buffer but keep split
map <leader>lp :bn\|bd#<cr>



" change up to semicolon. hi css :) // WTF?
":nnoremap <Leader>; ct;


" close buffer keep window split with next buffer


" Map <leader>d to insert == YYMMDD and move to new line
"nnoremap <silent> <leader>z i== <C-r>=strftime("%y%m%d")<CR><Esc>o<Esc>
"nnoremap <silent> <leader>z i== <C-r>=strftime("%y%m%d %H:%M")<CR><Esc>i<Esc>=
"nnoremap <silent> <leader>d i== <C-r>=strftime("%y%m%d %H:%M")<CR><Esc>o"
"nnoremap <silent> <leader>z i== <C-r>=strftime("%y%m%d %H:%M")<CR> PT<Esc><CR>a
"nnoremap <silent> <leader>z O== <C-r>=strftime("%y%m%d / %H:%M")<CR> PT<Esc>o<Esc>o<Esc>o<Up><Up>
"nnoremap <silent> <leader>z :execute 'normal! O== ' . strftime("%y%m%d / %H:%M") . ' PT'<CR>o<Esc>o<Esc>o<Esc>kk
"nnoremap <silent> <leader>z :<C-u>put! = '== ' . strftime('%y%m%d / %H:%M') . ' PT'<Bar>put = ''<Bar>put = ''<Bar>put = ''<Bar>normal! k<CR>

"nnoremap <silent> <leader>z :execute 'normal! O== ' . strftime('%y%m%d / %H:%M') . ' PT'<CR>:normal! o<Esc>o<Esc>o<Esc>kk<CR>
nnoremap <silent> <leader>z :execute 'normal! O== ' . strftime('%y%m%d / %H:%M') . ' PT'<CR>:normal! o<Esc>o<Esc>o<Esc>kk<CR>:startinsert!<CR>


" ----- VIEWPORT
set showcmd
set ruler
set number
set background=dark
set guifont=Roboto\ Mono:h14
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

" TODO make these a toggle
" set light theme
function! LightTheme()
  color pencil
  set background=light
endfunction

" set dark theme
function! DarkTheme()
  color codeschool
  set background=dark
endfunction



" ----- CURSOR
set guicursor+=a:blinkon0
hi Cursor guifg=red guibg=yellow



" ----- WHITESPACE
"set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2
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



" ----- SEARCHING
set hlsearch
set incsearch
set ignorecase
set smartcase



" ----- LANG SPECIFICS
autocmd BufRead,BufNewFile *.json setf javascript

autocmd BufEnter *.py  set et ts=4 sts=4 sw=4
autocmd BufLeave *.py  set et ts=2 sts=2 sw=2
au BufNewFile,BufRead *.scss set filetype=scss
au BufNewFile,BufRead *.eco set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html

au BufNewFile,BufRead *.sass set filetype=haml
au BufNewFile,BufRead *.jade set filetype=haml

au FileType json syn clear jsonStringSQError jsonTrailingCommaError jsonCommentError jsonNoQuotesError


" ----- CURSOR HUD
" toggle colorcolumn all windows
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

" toggle colorcolumn single window
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



" ----- VENDOR
set list listchars=tab:>.,trail:.,extends:$,precedes:<

" ulti snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctrl p
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_user_command = 'find %s -type f | grep -v -P "\.jpg$|/tmp/"'

" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "context"

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" close nerdtree if file opened from there
"let NERDTreeQuitOnOpen = 1

" close tab if only nerdtree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vim surround
" yss c / Sc
let g:surround_99 = "{/* \r */}"


" ----- MACROS
" 70 col line sepr
"let @q = 'i69i='
"let @w = 'i69i='
let @q = '€k8o69i=o'   " with date
let @w = 'o=vy80pxo'          " equals sign only
let @p = 'O€ku@q'      " pretty timestamp 70 col

" convert 4 spaces to 2
"let @r=':set €ýc€ýb€ýc€ýbtabstop=2:setexpandtab!€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl :retab!:%s/\t\t/\t/g:set expandtab:retab'
let @r = ':set tabstop=2:set expandtab!:retab!:%s/\t\t/\t/g:set expandtab:retab'

" insert line above/below in command mode
let @a = 'Oj'
let @b = 'ok'

" linebreak at cursor in command mode
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



" ----- COOKBOOK
" :bp|bd #            // close buffer but keep split
" :%! jq              // jquery format
