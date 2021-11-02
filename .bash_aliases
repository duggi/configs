# -- GLOBAL ALIAS
alias brc='mvim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias pg='ping www.google.com'
alias l='ls -l1GF'
alias lx='ls -lGF'
alias la='ls -laGF'
alias lad='ls -lGF | sort -k1 -r'
alias ..='cd ..'
alias xgrep='grep -iIR --exclude-dir={tmp,log,public,minified} --exclude=\*.min.*'
mkcd () {
  case "$1" in /*) :;; *) set -- "./$1";; esac
  mkdir -p "$1" && cd "$1"
}
cl(){ cd "$@" && la; }


## -- GIT
alias gp='git pull'
alias gps='git push'
alias gs='git status'
alias gl='git log'
alias gls='git log --stat'
alias gl1="git log --oneline"
alias gl2="git log --oneline --pretty=format:'%C(yellow)%h%Creset %C(magenta)(%cD)%Creset %s %C(bold blue)<%an>%Creset'"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ge=gitOpen
function gitOpen() {
  mvim `git status --porcelain | sed -ne 's/^ M //p'`
}


## -- WORDPRESS
alias wp='cd /var/www/html'
alias wpt='cd /var/www/html/wp-content/themes/hestia-gv'
