# Setup custom prompt string.
#


# Check ANSI colour support.
case "$TERM" in
  xterm-*color ) colorize=yes ;;
  * )            colorize=no  ;;
esac

# Debian-style prompt.
deb_ncol='\u@\h:\w\$ '
deb_wcol='\[\e[0m\]\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[37m\]\$\[\e[0m\] '

if [ "$colorize" = yes ] ; then
  PS1=$deb_wcol
else
  PS1=$deb_ncol
fi

unset deb_ncol
unset deb_wcol
unset colorize
