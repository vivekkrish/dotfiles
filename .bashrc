# .bashrc
# User specific environment and startup programs
#-------------------------#
# ENVIRONMENT - LOCALE    #
#-------------------------#
export LC_ALL="C"
export LC_CTYPE=$LC_ALL
export LC_COLLATE="C"

#-----------------------------#
# ENVIRONMENT - APPLICATIONS  #
#-----------------------------#
export LESSOPEN="|lesspipe.sh %s"
export LESS="-i -M -R -W -S -x4"
export PAGER=less
export GREP_COLOR=31
#export GREP_OPTIONS="--color=always"
export NOSPLASH=1
export NOWELCOME=1
export EDITOR=vim VISUAL=vim
export IGNOREEOF=2

#------------------------------#
# usepackage derived variables #
#------------------------------#
# use GLOBAL
export HOST="`uname -n`"
export GLOBAL_PATH=/usr/local/global.files
export PRINTER="`cat ~/.defaultprinter`"
export WWW_HOME="http://www.jcvi.org"
export TITLE="${USER}@$HOST%"
export OSVERSION="`uname -r`"
export RELEASE="`uname -r`"
export MACHINE="`uname -n`"
export RSYNC_RSH="ssh"
#export JAVA_HOME=/usr/local/java/current
#export JAVA_BINDIR=${JAVA_HOME}/bin
#export JAVA_ROOT=${JAVA_HOME}
#export JRE_HOME=${JAVA_HOME}/jre
#export JDK_HOME=${JAVA_HOME}
#export SDK_HOME=${JAVA_HOME}
#export JDBC_HOME=/usr/local/common/jConnect-6_0
#export CLASSPATH=.:${JDBC_HOME}/classes/jconn3.jar

# PREFIX_PATH
#PREFIX_PATH=/home/vkrishna

# local/packages
PACKAGES=/usr/local/packages

# use ANNOTATION_ENV
export ANNOTATION_DIR=/usr/local/annotation

# use EGC
export ANNOT_DEVEL=/usr/local/devel/ANNOTATION
export EGC_SCRIPTS=${ANNOT_DEVEL}/euk_genome_control/bin
export EGC_UTILITIES=${ANNOT_DEVEL}/EGC_utilities
export EUK_MODULES=${ANNOT_DEVEL}/Euk_modules/bin
export EUK_ORGANIZATION=${ANNOT_DEVEL}/EUK_ORGANIZATION

# Medicago/Annotation specific
export GBROWSE=${ANNOT_DEVEL}/vkrishna/GBrowse
export PROJECTS=/usr/local/projects
export MTG3=${PROJECTS}/MTG3
export MTG4=${PROJECTS}/MTG4
export AIP=${PROJECTS}/AIP
export CURRENT=${MTG4}/A17/Current_annotation
export MTA4=/usr/local/annotation/MTA4
export BOG=${PROJECTS}/BOG
export WILLOW=${PROJECTS}/WILLOW
export MACHTYPE="x86_64"

# Amazon EC2 Private Key
export EC2_PRIVATE_KEY=/usr/local/projects/MTG4/Workshop2013/AWS/jcvi_workshop_2013-$USER.pem

# PASA
#export PASAHOME=${MTG4}/packages/PASA2

# Trinity
export TRINITY_HOME=${MTG4}/packages/trinityrnaseq

# PASA
export PASAHOME=${MTG4}/packages/PASA2

# JBrowse
export JBROWSE=${MTG4}/packages/JBrowse-current

# NCBI-BLAST+
export BLASTPLUS=${PACKAGES}/ncbi-blast+/bin

# MAKER HOME
export MAKER_HOME=${MTG4}/packages/maker

# AUGUSTUS
export AUGUSTUS_CONFIG_PATH=${PACKAGES}/augustus/config

# PATH
RPATH="${HOME}/bin|/opt/real/RealPlayer|/usr/local/bin|/usr/local/sbin"
PATH=$( echo ${PATH} | tr -s ":" "\n" | grep -vwE "(${RPATH})" | tr -s "\n" ":" | sed "s/:$//" )

if [[ "${HOSTNAME}" == "itchy" ]]; then
    ## itchy.jcvi.org specific configuration for BISQUE
    export BQROOT=/opt/www/maize-bisque
    #export BQVERSION="bisque-053"

    PATH=${BQROOT}/bin:/usr/local/bin:/usr/local/sbin:${PATH}:{$HOME}/bin
    LD_LIBRARY_PATH=${PACKAGES}/mysql/lib:${BQROOT}/lib:${PACKAGES}/fftw/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/python/lib:/usr/local/lib64:${HOME}/lib
    PKG_CONFIG_PATH=${BQROOT}/lib/pkgconfig
    PYTHONPATH=${BQROOT}/lib/python2.7/site-packages:${PACKAGES}/python/lib/python2.7/site-packages
    HDF5_DIR=/usr/local/packages/hdf5
elif [[ "${HOSTNAME}" == "columbia" ]]; then
    PATH=${AIP}/local/bin:/opt/www/araport/bin:/usr/local/bin:/usr/local/sbin:${HOME}/bin/icommands:${HOME}/bin:${PATH}
    LD_LIBRARY_PATH=${AIP}/local/lib:/opt/www/araport/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/python/lib:/usr/local/lib:${HOME}/lib
    PYTHONPATH=${HOME}/git:${PACKAGES}/python/lib/python2.7/site-packages:${HOME}/lib/python2.7/site-packages:${HOME}/lib/python2.6/site-packages:/home/htang/lib/python2.7/site-packages
    PERL5LIB=${AIP}/local/lib
else
    # PATH
    PATH=${AIP}/local/bin:/export/apache2/bin:/export/php/bin:/export/bin:${HOME}/bin/eval:${HOME}/bin/icommands:${HOME}/.perl-shell:${HOME}/bin/${MACHTYPE}:${HOME}/bin:${EGC_SCRIPTS}:${EGC_UTILITIES}:${EUK_MODULES}:${BLASTPLUS}:/usr/local/bin:/usr/local/sbin:${MAKER_HOME}/bin:${MTG4}/local/bin:/usr/local/genome/bin:/usr/local/common:${PATH}
    PATH=${PATH}:/home/sgeworker/bin:/usr/sbin:/sbin:/opt/real/RealPlayer

    # LD_LIBRARY_PATH
    LD_LIBRARY_PATH=${AIP}/local/lib:/export/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/samtools/lib:${PACKAGES}/bzip2/lib:${PACKAGES}/python/lib:${PACKAGES}/sybase/OCS/lib:/usr/local/lib:${HOME}/lib:/usr/lib64:${MTG4}/local/lib

    # PYTHONPATH
    PYTHONPATH=${HOME}/git:${PACKAGES}/python/lib/python2.6/site-packages:${PACKAGES}/python/lib/python2.7/site-packages:${HOME}/lib/python2.6/site-packages:${HOME}/lib/python2.7/site-packages:/home/htang/lib/python2.7/site-packages

    # PERL5LIB
    #PERL5LIB=${HOME}/lib:${HOME}/lib/eval:${HOME}/git.local/jcvi/db/lib:${EUK_MODULES}:${EGC_SCRIPTS}
    PERL5LIB=$AIP/local/lib:${HOME}/git.local/jcvi/db/lib:${EUK_MODULES}:${EGC_SCRIPTS}

    # PKG_CONFIG_PATH
    PKG_CONFIG_PATH=/usr/lib/pkgconfig:${PACKAGES}/glib/lib/pkgconfig

    ## CHADO
    export GMOD_ROOT=/usr/local/projects/AIP/vkrishna/gmod
    export CHADO_DB_NAME=chadotest1
    export CHADO_DB_USERNAME=vkrishna
    export CHADO_DB_PASSWORD=vkrishna9
    export CHADO_DB_HOST=localhost
    export CHADO_DB_PORT=5432
fi
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${HOME}/lib/pkgconfig

export PATH LD_LIBRARY_PATH PYTHONPATH PKG_CONFIG_PATH PERL5LIB

# use phred
export PHRED_PARAMETER_FILE=/usr/local/etc/PhredPar/phredpar.dat

# use tmake
export TMAKEPATH=${PACKAGES}/tmake/lib/linux-g++

# use polybaye
export POLYBAYES_LIB=${PACKAGES}/PolyBayes_3_0/lib

# use cvs
export CVSROOT=":ext:${USER}@cvs.jcvi.org:/usr/local/src/cvsroot"

# use sybase
export SYBASE=${PACKAGES}/sybase
export LANG=en_US.UTF-8
export DSQUERY="SYBPROD"

# EVM
export EVM=${ANNOT_DEVEL}/EVidenceModeler

# use hmm
export HMMER_NCPU="1"
export HMM_SCRIPTS=${ANNOT_DEVEL}/hmm/bin

# InterProScan
export IPRSCAN_HOME=${ANNOT_DEVEL}/iprscan/iprscan_v4.7
export IPRSCAN_LIB=${IPRSCAN_HOME}/lib

# AAT
export AATPATH=/usr/local/bin

export SVNHOME="http://isvn.tigr.org/ANNOTATION"
export TZ="EST5EDT"
export LOGNAME="vkrishna"

# CURL
export CURL_LIBS=${PACKAGES}/curl/lib
export CURL_CFLAGS=${PACKAGES}/curl/include

# BOOST libs
export BOOST_ROOT=${PACKAGES}/boost

# OPENMP thread number
export OMP_NUM_THREADS=64

# MYSQL
export MYSQLINC=${PACKAGES}/mysql/include/mysql
export MYSQLLIBS="${PACKAGES}/mysql/lib/mysql/libmysqlclient.a -lz"

# use shell
ulimit -s unlimited >& /dev/null
ulimit -Sc 0 >& /dev/null
umask 002

# Import custom ENV
if [[ ${HOSTNAME} != "itchy" ]]; then
    export PCODE="0372"
    export EMAIL="vkrishna@jcvi.org"

    SGE=/usr/local/sge_current/jcvi/common/settings.sh
    WORKFLOW=${ANNOT_DEVEL}/workflow-3.1.3/exec_env.bash
    JAVA160=/usr/local/common/env/java6.sh
    GITCOMP=${HOME}/.git-completion.sh
    ICMDS=~/.i-commands-auto.bash

    declare -a ENVVARS=(SGE WORKFLOW JAVA160 GITCOMP ICMDS)
    for i in ${ENVVARS[@]}; do
        eval ENVVAR=\$$i
        if [ -r "$ENVVAR" ]; then
            if [ "$PS1" ]; then
                . "$ENVVAR"
            else
                . "$ENVVAR" >/dev/null 2>&1
            fi
        fi
    done
fi

# MANPATH
MANPATH=${HOME}/share/man:/usr/local/common/man:${MANPATH}
MANPATH=${MANPATH}:/usr/man:/usr/X11R6/man:/opt/gnome/share/man:/usr/openwin/man
export MANPATH

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
export TERM="xterm-color"

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
export     HISTSIZE=50000
export HISTFILESIZE=100000
#export HISTTIMEFORMAT="%Y%m%d %H:%M:%S "

# make bash append the history rather than overwrite it
shopt -s histappend       # append to history, don't overwrite it

# ignore some of the common commands
export HISTIGNORE="&:ls:[bf]g:exit:ll:la:l:cd:pwd:su:df:clear:cd ..:history"

# Set the prompt command
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} - ${PWD/#$HOME/~}"; echo -ne "\007"'

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#export GIT_PS1_SHOWUPSTREAM="auto"
#export GIT_PS1_SHOWDIRTYSTATE="true"

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

## LS_COLORS
#eval $(dircolors -b /home/vkrishna/git/LS_COLORS/LS_COLORS)
export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91'
