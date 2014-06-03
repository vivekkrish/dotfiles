# .bash_profile

# User specific environment and startup programs
# Get environment variables
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

##    REL=`cat /etc/*release`
##    if echo $REL | grep -Pq "release\s+6\.\d+"
##    then
##        # invoke fish-shell only when using CentOS 6
##        SHELL="${HOME}/bin/fish"
##        exec $SHELL
##    fi
