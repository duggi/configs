echo "# ~/.bash_profile"



# -- remove macOS bash terminal warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# -- add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# -- .bashrc is last
[[ -s ~/.bashrc ]] && source ~/.bashrc

