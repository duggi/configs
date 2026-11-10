echo "///////////////////////////////////////////"
echo "/////            ~/.bashrc            /////"
echo "///////////////////////////////////////////"
echo ""



# -- ENV
export EDITOR=/usr/bin/vim
export LESS_IS_MORE=1
alias grep='grep --color=auto'
alias pg='ping www.google.com'


# -- NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# -- SYSTEM
alias x='exit'
alias ..='cd ..'
alias l='ls -l1GF'
alias lx='ls -lGF'
alias la='gls -laGF --group-directories-first'
alias lad='ls -lGF | sort -k1 -r'
alias tree='tree -C -I "node_modules"'
#alias xg='grep -iIR --exclude-dir={tmp,log,public,minified,.git,.circleci,node_modules,vendor,.next,.next-e2e} --exclude={\*.min.*,\*.svg}'

# easy grepping
alias xg=xg
xg() {
  grep -iIR \
    --exclude-dir={tmp,log,logs,public,minified,vendor,node_modules,.git,.circleci,.next,.next-e2e,dist,build,out,coverage,.turbo,.cache,.vercel,.parcel-cache,.svelte-kit,storybook-static,playwright-report,test-results,blob-report,.pnpm-store,.yarn} \
    --exclude={'*.min.*','*.svg','*.map','*.tsbuildinfo','*.log','*.lock','pnpm-lock.yaml','package-lock.json','*.snap'} \
    "$@"
}


xf() {
  find . \( -name node_modules -o -name tmp -o -name log \) -prune -o -name "*$1*" -print
}

alias oxg=xgOpen
alias oxf=findOpen
function xgOpen() {
  mvim $(xg -l $1 $2)
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


# -- BASH
alias macs='cat ~/.bashrc'
alias brc='mvim ~/.bashrc'
alias sbrc='exec bash -l'
alias sshrc='mvim ~/.ssh/config'


# -- VIM
alias m='mvim'
alias vimrc='mvim ~/.vimrc'


# -- GIT
alias gcl='git config --list'
alias gp='git pull'
alias gps='git push'
alias gd='git diff'
alias gd2='git diff --cached --stat'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gsp='git status --porcelain'
alias gss='git status --short'
alias gl='git log'
alias gl0='git log --stat'
alias gl1="git log --pretty=format:'%C(yellow)%h %C(reset)%s %C(green)<%an>%Creset' --date=short"
alias gl2="git log --pretty=format:'%C(yellow)%h %C(magenta)%ad %Creset%s %C(green)<%an>%Creset' --date=short"
alias gl3="git log --graph --pretty=format:'%C(yellow)%h% %C(yellow)%d%Creset %s %C(magenta)%ad %C(green)<%an>%Creset' --date=short"
alias ge=gitOpen
function gitOpen() {
  mvim `git status --porcelain | sed -ne 's/^ M //p'`
}


# -- NOTES
gdpath='/Users/doug/Library/CloudStorage/GoogleDrive-douglee650\@gmail.com/My\ Drive'
notespath="${gdpath}/notes"
#alias logg='mvim ~/logg.txt -c "normal \<leader>z"'
#alias scratch='mvim ~/scratch.txt -c "normal \<leader>z"'
alias logg='mvim ~/logg.txt -c "call feedkeys(\",z\")"'
alias scr='mvim ~/scratch.txt -c "call feedkeys(\",z\")"'
alias doit="mvim ${notespath}/_doit.txt"
alias ideas="mvim ${notespath}/_ideas.txt"
alias notes="mvim ${notespath}/_notes.txt"
alias thoughts="mvim ${notespath}/_thoughts.txt"
alias work="mvim ${notespath}/_work.txt"
alias t='thoughts'
alias love="mvim ${notespath}/_love.txt"
alias live="open ${gdpath}/living"


# -- MAC OS SPECIFIC
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias cap='screencapture -T5 -c'


# -- WACOM DRIVER MANAGEMENT
wacom-stop()    { launchctl unload /Library/LaunchAgents/com.wacom.* && echo "Wacom stopped"; }
wacom-start()   { launchctl load /Library/LaunchAgents/com.wacom.* && echo "Wacom started"; }
rewacom()       { echo "Restarting Wacom..."; wacom-stop; wacom-start; }



# -- LOCAL (machine and work specific, not checked in)
[[ -s ~/.bashrc.local ]] && source ~/.bashrc.local
