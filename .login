# display local login message
#RND_NUM=$[ ( $RANDOM % 4 )  + 1 ]

if [ -r "$HOME/.banner.login" ]; then
  if [ -r "$HOME/.banners/banner$RND_NUM" ]; then
	cat $HOME/.banners/banner$RND_NUM
  fi

  ascii="${HOME}/.banner.ascii"
  if [[ -a $ascii ]] ; then . $ascii ; fi
  cat $HOME/.banner.login
fi

# display global login message
if [ -r /etc/motd ]; then
  cat /etc/motd
  echo " "
fi
