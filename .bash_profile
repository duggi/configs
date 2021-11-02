echo "***** BASH_PROFILE: ~/.bash_profile"

# source
#source ~/.profile
[[ -s ~/.bashrc ]] && source ~/.bashrc


# -- NVM
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

export PATH=$(echo $PATH | sed 's|/usr/local/bin||; s|/usr/local/sbin||; s|::|:|; s|^:||; s|\(.*\)|/usr/local/bin:/usr/local/sbin:\1|')


# -- RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
