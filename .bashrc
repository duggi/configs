# --- this .bashrc file fully pwned by ---
#    _             _            _
#  _| |___ _ _ ___| |___ ___   | |___ ___
# | . | . | | | . | | .'|_ -|  | | -_| -_|
# |___|___|___|_  |_|__,|___|  |_|___|___|
#             |___|
# ------------------------------ ~/.bashrc

# ------------------------------------- HONESTLY, I HAVE NO IDEAS

if [ -f /private/etc/bashrc ]; then
    . /private/etc/bashrc
fi

export PATH=/usr/local/bin:${PATH}
export PATH=/Applications/CoronaSDK/:${PATH}
export EDITOR=/usr/bin/vim
export NODE_PATH=/usr/local/lib/node_modules
export GREP_OPTIONS='--color=auto'


# ------------------------------------- ALIASES
alias vimrc='vim ~/.vimrc'
alias boom='vim ~/notes/BOOM.txt'
alias bam='vim ~/notes/MEGABLOG.txt'
alias tips='vim ~/notes/TIPS.txt'
alias notes='vim ~/notes/NOTES.txt'
alias doit='vim ~/notes/DOIT.txt'
alias macs='cat /etc/bashrc ~/.bashrc'


# proj
alias proj='cd /Users/duggi/Projects'
alias 1099='cd /Users/duggi/Projects/1099'
alias pers='cd /Users/duggi/Projects/personal'
alias bbg='cd /Users/duggi/bigbadgoose/'
alias dev='cd /Users/duggi/bigbadgoose/dev'
alias db='cd /Users/duggi/bigbadgoose/Dropbox'
alias gd='cd /Users/duggi/bigbadgoose/Google\ Drive'


# rails
alias rs='rails s'
alias rc='rails c'


# git
alias gp='git pull'
alias gs='git status'
alias gl='git log'
alias gls='git log --stat'
alias gl1='git log --oneline'
alias glg="git log --pretty=format:'%h %an %ar: %s' --graph"

alias stat='git status'



# -----------------------------------------
. ~/.nvm/nvm.sh
