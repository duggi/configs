echo "***** BASHRC: ~/.bashrc"

# -- WHEN VIDCAM GETS STUCK
#alias resetcam="sudo killall VDCAssistant"

# -- PATH
#export PATH=/usr/local/share/python:${PATH}
#export PATH=/usr/local/bin:${PATH}
#export PATH=/usr/local/share/npm/bin:${PATH}
#export PATH=/usr/local/bin:/usr/local/sbin:$PATH
#export PATH="$PATH:~/Library/Phabricator/arcanist/bin/"
#export NODE_PATH=/usr/local/lib/node_modules


# -- REFERENCE
# - mvim files returned from grep
# mvim $(grep -rIl 'grepstring' path)


export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export LESS_IS_MORE=1

alias vimrc='mvim ~/.vimrc'
alias macs='cat ~/.bash_aliases /etc/bashrc ~/.bashrc'
alias tree='tree -C'


# -- GLOBAL ALIAS
alias m='mvim'
alias brc='mvim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias pg='ping www.google.com'
alias l='ls -l1GF'
alias lx='ls -lGF'
alias la='ls -laGF'
alias lad='ls -lGF | sort -k1 -r'
alias ..='cd ..'

alias xgrep='grep -iIR --exclude-dir={tmp,log,public,minified,.git,.circleci,node_modules,vendor} --exclude={\*.min.*,\*.svg}'
alias oxgrep=xgrepOpen
alias xfind="find . -name $1"
alias xfindd="find . -name $1"
alias oxfind=findOpen

alias ~='cd ~'
alias dt='cd ~/Desktop'
alias cap='screencapture -T5 -c'

function xgrepOpen() {
  # grep <term> <path> : $0 $1 $2
  mvim $(xgrep -l $1 $2)
}

function findOpen() {
  # find . -name ""
  mvim $(find . -name $1)
}

mkcd () {
  case "$1" in /*) :;; *) set -- "./$1";; esac
  mkdir -p "$1" && cd "$1"
}
cl(){ cd "$@" && la; }


# -- NOTES
alias thoughts='mvim ~/_thoughts.txt'
alias liv='open /Volumes/GoogleDrive/My\ Drive/living'
alias tb='open https://tidbits-tln.firebaseapp.com/'


# -- DIRS
alias dev='cd ~/dev'
alias gvdc='cd ~/dev/guidevine-saas'
alias gve='cd ~/dev/gve'
alias gv='cd /Volumes/GoogleDrive/My\ Drive/guidevine'
alias ogv='open /Volumes/GoogleDrive/My\ Drive/guidevine'
alias gvedb='psql -Udouglee2 -dgve_dev'


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
#alias gpr='git pull --rebase origin master'


## -- WORDPRESS
alias wp='cd ~/Sites/newsroom'
alias wpt='cd ~/Sites/newsroom/wp-content/themes/hestia-gv'

## -- DATABASE
alias spg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias sms="mysql.server start"
alias ar="sudo apachectl restart"



#
## -- SPECIFICS
#alias gvmongo="mongod --dbpath=/usr/local/var/mongodb/"
# runs server and service worker
alias gvrails="heroku local -f Procfile.dev"



#### Added by the Heroku Toolbelt
#export PATH="$PATH:/usr/local/heroku/bin"

alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## defaults write com.apple.finder AppleShowAllFiles NO
## PGUSER=douglee PGPASSWORD='' heroku pg:pull DATABASE_URL guidevine_development --app guidevine-production

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PGDATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/Cellar/sass/1.14.3

## NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
