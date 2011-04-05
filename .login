# display local login message
RND_NUM=$[ ( $RANDOM % 4 )  + 1 ]

if [ -r "$HOME/.banner.login" ]; then
  if [ -r "$HOME/.banners/banner$RND_NUM" ]; then
	cat $HOME/.banners/banner$RND_NUM
  fi
  cat $HOME/.banner.login
  echo " "
fi

# display global login message 
if [ -r /etc/motd ]; then
  cat /etc/motd
  echo " "
fi
