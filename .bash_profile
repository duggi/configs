# -----------------------------------------------------------------------------
echo "-- BASH_PROFILE"
# -----------------------------------------------------------------------------



[[ -s ~/.bashrc ]] && source ~/.bashrc

# -- NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# -- RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
