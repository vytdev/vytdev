# A small script to set a custom prompt
# string (PS1).
#
# Here's what the prompt looks like:
#
# ┌─[root@localhost]─(~) <branch> [0] Mon Jan 01 00:00:00
# └── $
#

# First, we need to check if the terminal
# supports ANSI colours.
case "$TERM" in
  xterm-*color )
    colorize=yes
    ;;
  * )
    colorize=no
    ;;
esac

# PS1 options.
nocolor='\n┌─[\u@\h]─(\w)$(__git_ps1 " <%s>") [$?] \d \t\n└── \$ '
colored='\n\[\e[0m\]\[\e[38;2;128;128;128m\]┌─[\[\e[32m\]\u@\h\[\e[38;2;128;128;128m\]]─(\[\e[33m\]\w\[\e[38;2;128;128;128m\])$(__git_ps1 " <\[\e[35m\]%s\[\e[38;2;128;128;128m\]>") [\[\e[36m\]$?\[\e[38;2;128;128;128m\]] \[\e[34m\]\d \t\n\[\e[38;2;128;128;128m\]└── \[\e[31m\]\$\[\e[0m\] '

# We need __git_ps1
if ! type __git_ps1 >/dev/null 2>&1 ; then
  if [ -r /etc/bash_completion.d/git-prompt ] ; then
    . /etc/bash_completion.d/git-prompt
    #GIT_PS1_SHOWCOLORHINTS=true
  else
    __git_ps1() { return; }
  fi
fi

# Let's set which custom prompt
# string to use.
if [ "$colorize" = yes ] ; then
  PS1=$colored
else
  PS1=$nocolor
fi

unset colorize
unset nocolor
unset colored
