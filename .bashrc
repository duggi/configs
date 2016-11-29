# -----------------------------------------------------------------------------
echo "-- .BASHRC"



# -- WHEN VIDCAM GETS STUCK
alias resetcam="sudo killall VDCAssistant"

# -- PATH
export PATH=/usr/local/share/python:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=/usr/local/share/npm/bin:${PATH}
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$PATH:~/Library/Phabricator/arcanist/bin/"

export EDITOR=/usr/bin/vim
export NODE_PATH=/usr/local/lib/node_modules
export GREP_OPTIONS='--color=auto'

source ~/Library/Phabricator/arcanist/resources/shell/bash-completion

# -- ALIASES
alias vimrc='mvim ~/.vimrc'
alias macs='cat /etc/bashrc ~/.bashrc'

alias thoughts='mvim ~/bbg/Google\ Drive/notes/thoughts.txt'
alias gvnotes='mvim ~/dev/guidevine/NOTES.txt'
alias notes='mvim ~/bbg/Google\ Drive/notes/notes.txt'
alias devnotes='mvim ~/bbg/Google\ Drive/notes/devnotes.txt'
alias doit='mvim ~/bbg/Google\ Drive/notes/doit.txt'

alias bbg='cd /Users/douglee/bbg'
alias dev='cd /Users/douglee/dev'
alias gv='cd /Users/douglee/dev/guidevine'
alias gvb='cd /Users/douglee/Sites/newsroom/wp-content/themes/guidevine-wordpress'
alias bz='cd /Users/douglee/dev/bizconomy'
alias pastd='cd /Users/douglee/dev/paster'
alias db='cd /Users/douglee/bbg/Dropbox'
alias gd='cd /Users/douglee/bbg/Google\ Drive'
alias gdv='cd /Users/douglee/bbg/Google\ Drive/guidevine'
alias gdc='cd /Users/douglee/bbg/Google\ Drive/clients'
alias stuff='cd /Users/douglee/stuff'

# -- RAILS
alias rs='rails s'
alias rc='rails c'
alias bers='bundle exec foreman run rails server'
alias berc='bundle exec foreman run rails console'
alias be='bundle exec foreman run'
alias js='jekyll serve -w --trace'

# -- GIT
alias gp='git pull'
alias gpr='git pull --rebase origin master'
alias gps='git push'
alias gs='git status'
alias gl='git log'
alias gls='git log --stat'
alias gl1="git log --oneline"
alias gl2="git log --oneline --pretty=format:'%C(yellow)%h%Creset %C(magenta)(%cD)%Creset %s %C(bold blue)<%an>%Creset'"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# -- DATABASE
alias spg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias sms="mysql.server start"

# -- SPECIFICS
alias gvmongo="mongod --dbpath=/usr/local/var/mongodb/"
alias gvrails="foreman run bin/rails s"
alias gvsidekiq="bin/rake sidekiq:run"



### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

alias ge=gitOpen
function gitOpen() {
  mvim `git status --porcelain | sed -ne 's/^ M //p'`
}


# defaults write com.apple.finder AppleShowAllFiles NO
# PGUSER=douglee PGPASSWORD='' heroku pg:pull DATABASE_URL guidevine_development --app guidevine-production
