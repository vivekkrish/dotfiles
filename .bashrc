## # .bashrc
## # User specific environment and startup programs
#-------------------------#
# SHELL - CHECK TYPE      #
#-------------------------#
[[ $- != *i* ]] && return

# Add bash aliases.
if [ -f "${HOME}/.bash_aliases" ]; then
  . ${HOME}/.bash_aliases
fi

# User specific aliases and functions
if [ -f "${HOME}/.bash_functions" ]; then
  . ${HOME}/.bash_functions
fi

# Custom JCVI login banner
if [ -f "${HOME}/.login" ]; then
  . ${HOME}/.login
fi

# set terminal colors
export TERM="xterm-256color"

# check window size
shopt -s checkwinsize

# ignore small spelling mistakes in directory names
shopt -s cdspell
# multiple line commands stay together in the history
shopt -s cmdhist
# auto correct the case
shopt -s nocaseglob
shopt -s extglob
shopt -s dotglob
shopt -s checkhash
shopt -s cdable_vars
shopt -s no_empty_cmd_completion

# don't allow shell to exit if there are running jobs
#shopt -s checkjobs

# make bash autocomplete with up arrow
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
bind Space:magic-space

# alt+r -- search history based on a mask (augments Arrow up):
# method 1
#cmd_mhist="\"\C-k\C-ahistory | grep '^ *[0-9]* *\C-e.'\C-m\""
# method 2
cmd_mhist="\"\C-k\C-uhistory | grep \\\"^ *[0-9]* *\C-y\\\" \C-m\""
bind '"\M-r"':"$cmd_mhist"

# alt+k -- paste current command line into history and begin new line
cmd_hist="\"\C-ahistory -s '\C-e'\C-m\""
bind '"\M-k"':"$cmd_hist"

# ctrl+xPgUp: show last 25 entries of the history
# (erase the line first)
bind '"\C-x\e[5~"':"\"\C-k\C-uhistory | tail -25\C-m\""

# Now map xterm's alternative keybindings to existing functionality
# Some are simple translations to correspontend M- combinations
# ctrl+left/right arrows:
bind '"\e\x5b\x31\x3b\x35\x44"':backward-word
bind '"\e\x5b\x31\x3b\x35\x43"':forward-word
# alt+b/f: the usual word navigation but in xterm terms
bind '"\xe2"':backward-word
bind '"\xe6"':forward-word
# atl+backspace:
bind '"\xff"':backward-kill-word
# alt+'.':
bind '"\xae"':yank-last-arg
# alt+k:
bind '"\xeb"':"$cmd_hist"
# alt+r:
bind '"\xf2"':"$cmd_mhist"

# verify command before running it
shopt -s histverify

# If a history expansion fails, let the user re-edit the command
shopt -s histreedit

# don't put duplicate lines in the history
export HISTCONTROL=ignorespace:erasedups    # ignore space and erase duplicate entries

# big big history
export     HISTSIZE="NOTHING"
export HISTFILESIZE="NOTHING"
#export HISTTIMEFORMAT="%Y%m%d %H:%M:%S "

# make bash append the history rather than overwrite it
shopt -s histappend       # append to history, don't overwrite it

# ignore some of the common commands
export HISTIGNORE="&:ls:[bf]g:exit:ll:la:l:cd:pwd:su:df:clear:cd ..:history"

# Set the prompt command
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} - ${PWD/#$HOME/~}"; echo -ne "\007"'

## set up the PS1 via powershell
#PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# Save and reload the history after each command finishes
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a; history -c; history -r"

# Set the prompt PS1 variable
colors="${HOME}/.colors.bash"
if [[ -a $colors ]] ; then source $colors ; fi

# prompt and colors
if [ "$PS1" ] ; then
    # Add colors to grep
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'

    # MySQL prompt
    export MYSQL_PS1='\u@\h \d \c> '

    # git branch dirty state
    #source /etc/bash_completion.d/git
    #export GIT_PS1_SHOWDIRTYSTATE="true"
    #export GIT_PS1_SHOWUPSTREAM="auto"
    #git=\"\$(__git_ps1 \"(\[$Green\]%s\[$Reset\])\[$Yellow\]\$(__git_dirty)\[$Reset\] \")\"
    prompt="
    status=\$?

    timestamp='\[[$Magenta\]\d \t]\[$Reset\]'
    user='\[$BIBlue\]\u\[$Reset\]'
    host='\[$Yellow\]\h\[$Reset\]'
    cwd='\[$Cyan\]\w\[$Reset\]'

    prompt=\"\n\${timestamp}\n\${user}@\${host} \${cwd}\n\$ \"

    echo -e \"\${prompt}\"
    "
    export PS1="\$(${prompt})"
fi

####################################################################
# Bash Completion.
####################################################################
complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger
complete -A signal     kill killall
complete -A user       su userdel passwd
complete -A group      groupdel groupmod newgrp
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e "s/,.*//g" | uniq | grep -v "\["`;)" ssh

complete -A helptopic  help     # Currently,  same as builtins.
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract

# Documents - Postscript, pdf, dvi.....
complete -f -o default -X '!*.+(ps|PS)'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.+(dvi|DVI)' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.+(pdf|PDF)' acroread pdf2ps
complete -f -o default -X \
'!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
complete -f -o default -X \
'!*.+(doc|DOC|xls|XLS|ppt|PPT|sx?|SX?|csv|CSV|od?|OD?|ott|OTT)' soffice

# Multimedia
complete -f -o default -X \
'!*.+(gif|GIF|jp*g|JP*G|bmp|BMP|xpm|XPM|png|PNG)' xv gimp ee gqview
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123
complete -f -o default -X \
'!*.@(mp[23]|MP[23]|ogg|OGG|wav|WAV|pls|m3u|xm|mod|s[3t]m|it|mtm|ult|flac)' xmms
complete -f -o default -X \
'!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|asf|vob|VOB|bin|dat|vcd|\
ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|QT|wmv|mp3|MP3|ogg|OGG|\
ogm|OGM|mp4|MP4|wav|WAV|asx|ASX)' xine

# Misc
complete -f -o default -X '!*.pl'  perl perl5

# set up some bash completions for sam/bam/bedtools, bwa
# source: https://github.com/arq5x/bash_completion
source ${HOME}/git/arq5x_bash_completion/!(README.rst|.*)

## LS_COLORS
#eval $(dircolors -b /home/vkrishna/git/LS_COLORS/LS_COLORS)
export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91'
