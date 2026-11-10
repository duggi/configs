echo ""
echo "///////////////////////////////////////////"
echo "///// ~/.bash_profile sources .bashrc /////"
echo "///////////////////////////////////////////"
echo ""



# -- REMOVE MACOS BASH TERMINAL WARNING
export BASH_SILENCE_DEPRECATION_WARNING=1


# -- BIN
export PATH="$HOME/.local/bin:$PATH"


# -- PYTHON
export PATH="$HOME/Library/Python/3.9/bin:$PATH"


# -- ADD HOMEBREW TO PATH
eval "$(/opt/homebrew/bin/brew shellenv)"




# -- WHISPER-MLX
## symlink in ~/.local/bin/whisperx-mlx
## export PATH="/Users/doug/dev/whisperx-mlx/.venv311/bin:$PATH"


# BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# -- .BASHRC
[[ -s ~/.bashrc ]] && source ~/.bashrc
