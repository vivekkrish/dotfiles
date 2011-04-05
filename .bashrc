# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export TERM="xterm-color"
export IGNOREEOF=1

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
#PS1="\[\e[34;1m\]\u\[\e[0m\]@\[\e[31;1m\]\h:\[\e[30;2m\]\W$ \[\e[0m\]"

# check window size
shopt -s checkwinsize

# ignore small spelling mistakes in directory names
shopt -s cdspell
# multiple line commands stay together in the history
shopt -s cmdhist
# verify command before running it
shopt -s histverify
# auto correct the case
shopt -s nocaseglob
shopt -s extglob
shopt -s nullglob dotglob
shopt -s checkhash
shopt -s cdable_vars
shopt -s no_empty_cmd_completion

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#shell-sink
#export SHELL_SINK_COMMAND=shellsink-client
#export SHELL_SINK_ID=032456781a0fa91a378594af50f28592

# don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups    # ignore and erase duplicate entries
           
# big big history
export HISTSIZE=100000

# make bash append the history rather than overwrite it
shopt -s histappend       # append to history, don't overwrite it

# ignore some of the common commands
export HISTIGNORE="&:ls:[bf]g:exit:ll:la:l:cd:pwd:su:df:clear:cd ..:history"

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n; $SHELL_SINK_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Add bash aliases.
if [ -f "$HOME/.bash_aliases" ]; then
  source $HOME/.bash_aliases
fi

function extract()
{
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjvf "$1" ;;
            *.tar.gz) tar xzvf "$1" ;;
            *.tar.Z) tar xzvf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.jar) unzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjvf "$1" ;;
            *.tgz) tar xzvf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *) echo "'$1' cannot be extracted." ;;
        esac
    else
        echo "'$1' is not a file."
    fi
}

# Set the prompt PS1 variable
#PS1="\[\e[34;1m\]\u\[\e[0m\]@\[\e[31;1m\]\h:\[\e[0m\]\W$ \[\e[0m\]"
PS1="\[\e[34;1m\]\u\[\e[0m\]@\[\e[31;1m\]\h:\[\e[0m\]\W $ "

# Force the umask setting
umask 002
