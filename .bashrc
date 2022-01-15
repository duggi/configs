echo "# ~/.bashrc"



export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export LESS_IS_MORE=1
alias pg='ping www.google.com'


# -- BASH
alias macs='cat ~/.bashrc'
alias brc='mvim ~/.bashrc'
alias sbrc='source ~/.bashrc'


# -- VIM
alias m='mvim'
alias vimrc='mvim ~/.vimrc'


# -- SYSTEM
alias ..='cd ..'
alias l='ls -l1GF'
alias lx='ls -lGF'
alias la='ls -laGF'
alias lad='ls -lGF | sort -k1 -r'
alias tree='tree -C'
alias xgrep='grep -iIR --exclude-dir={tmp,log,public,minified,.git,.circleci,node_modules,vendor} --exclude={\*.min.*,\*.svg}'
alias oxgrep=xgrepOpen
alias xfind="find . -name $1"
alias oxfind=findOpen

function xgrepOpen() {
  mvim $(xgrep -l $1 $2)
}
function findOpen() {
  mvim $(find . -name $1)
}
mkcd() {
  case "$1" in /*) :;; *) set -- "./$1";; esac
  mkdir -p "$1" && cd "$1"
}
cl() { cd "$@" && la; }


# -- DIRS
alias ~='cd ~'
alias dev='cd ~/dev'
alias dt='cd ~/Desktop'


# -- NOTES
alias doit='open /Volumes/GoogleDrive/My\ Drive/notes/_doit.txt'
alias ideas='open /Volumes/GoogleDrive/My\ Drive/notes/_ideas.txt'
alias notes='open /Volumes/GoogleDrive/My\ Drive/notes/_notes.txt'
alias thoughts='open /Volumes/GoogleDrive/My\ Drive/notes/_thoughts.txt'
alias liv='open /Volumes/GoogleDrive/My\ Drive/living'
alias tb='open https://tidbits-tln.firebaseapp.com/'


## -- GIT
alias gp='git pull'
alias gps='git push'
alias gd='git diff'
alias gs='git status'
alias gsp='git status --porcelain'
alias gss='git status --short'
alias gl='git log'
alias gls='git log --stat'
alias gl1="git log --oneline"
alias gl2="git log --oneline --pretty=format:'%C(yellow)%h%Creset %C(magenta)(%cD)%Creset %s %C(bold blue)<%an>%Creset'"
alias gl3="git log --oneline --pretty=format:'%C(yellow)%h%Creset %Creset %s %C(bold blue)<%an>%Creset'"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ge=gitOpen
function gitOpen() {
  mvim `git status --porcelain | sed -ne 's/^ M //p'`
}


## -- LOCAL DEVOPS
alias spg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
export PGDATA=/usr/local/var/postgres
alias sms="mysql.server start"
alias ar="sudo apachectl restart"


## -- MAC OS SPECIFIC
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias cap='screencapture -T5 -c'
