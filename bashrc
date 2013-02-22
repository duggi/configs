# -------- this .bashrc file fully pwned by
#     _             _            _
#   _| |___ _ _ ___| |___ ___   | |___ ___
#  | . | . | | | . | | .'|_ -|  | | -_| -_|
#  |___|___|___|_  |_|__,|___|  |_|___|___|
#              |___|
#
# -----------------------------------------



# ------------------------------------- /ETC/BASHRC

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize



# ------------------------------------- GLOBAL ALIAS

alias brc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias pg='ping www.google.com'

alias l='ls -l1GF'
alias lx='ls -lGF'
alias la='ls -laGF'

function cl(){ cd "$@" && la; }



# ------------------------------------- ORIGINAL

#if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#fi

# System-wide .bashrc file for interactive bash(1) shells.
#if [ -z "$PS1" ]; then
#   return
#fi
#PS1='\h:\W \u\$ '

# Make bash check its window size after a process completes
#shopt -s checkwinsize

# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
								    
