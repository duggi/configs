echo "--> loaded ~/.bashrc"

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


# -- GLOBAL ALIAS
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


# -- CONFIG
alias vimrc='mvim ~/.vimrc'
alias macs='cat /etc/bashrc ~/.bashrc'
alias sshc='mvim ~/.ssh/config'


# -- NOTES
alias recipes='mvim ~/bbg/Google\ Drive/notes/recipes.txt'
alias thoughts='mvim ~/thoughts.txt'
alias notes='mvim ~/bbg/Google\ Drive/notes/notes.txt'
alias doit='mvim ~/bbg/Google\ Drive/notes/doit.txt'
alias hours='mvim ~/bbg/Google\ Drive/notes/hours.txt'
alias ideas='mvim ~/bbg/Google\ Drive/notes/ideas.txt'
alias devnotes='mvim ~/bbg/Google\ Drive/notes/devnotes.txt'
alias gvnotes='mvim ~/bbg/Google\ Drive/notes/gvnotes.txt'


# -- DIRS
alias bbg='cd ~/bbg'
alias dev='cd ~/bbg/dev'
alias gvs='cd ~/bbg/dev/guidevine-saas'
alias gve='cd ~/bbg/dev/gve'
alias gvb='cd /Users/douglee2/Sites/newsroom/wp-content/themes/guidevine-wordpress'
#alias gd='cd /Volumes/GoogleDrive/My\ Drive/'
alias gv='cd /Volumes/GoogleDrive/My\ Drive/guidevine'

#alias bz='cd /Users/douglee/dev/bizconomy'
#alias pastd='cd /Users/douglee/dev/paster'
#alias db='cd /Users/douglee/bbg/Dropbox'
#alias gdc='cd /Users/douglee/bbg/Google\ Drive/clients'
#alias stuff='cd /Users/douglee/stuff'

## -- RAILS
#alias rs='rails s'
#alias rc='rails c'
#alias bers='bundle exec foreman run rails server'
#alias berc='bundle exec foreman run rails console'
#alias be='bundle exec foreman run'
#alias js='jekyll serve -w --trace'

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
