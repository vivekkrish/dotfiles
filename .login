# Indirect pointer to the global .login file.
# Do NOT edit the next line

#source /usr/local/global.files/global.login

# Put any additions of yours here.

# display local login message
if [ -r "/usr/local/global.files/banner.login" ]; then
    ascii="${HOME}/.banner.ascii"
    if [[ -a $ascii ]]; then . $ascii; fi
    cat /usr/local/global.files/banner.login
fi

# display global login message
if [ -r /etc/motd ]; then
    cat /etc/motd
fi
