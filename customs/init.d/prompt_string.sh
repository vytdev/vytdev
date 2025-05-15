# A small script to set a custom prompt
# string (PS1).
#
# Here's what the prompt looks like:
#
# ┌─[root@localhost]─(~) <branch> [0] Mon Jan 01 00:00:00
# └── $
#


custom_path_to_git_prompt='/usr/share/git/git-prompt.sh'


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

# Debian-style prompt.
deb_ncol='\u@\h:\w\$ '
deb_wcol='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# We need __git_ps1
if ! type __git_ps1 >/dev/null 2>&1 ; then
  if [ -r "$custom_path_to_git_prompt" ] ; then
    . "$custom_path_to_git_prompt"
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

# Debian-style.
# if [ "$colorize" = yes ] ; then
#   PS1=$deb_wcol
# else
#   PS1=$deb_ncol
# fi

unset colorize
unset nocolor
unset colored

unset deb_ncol
unset deb_wcol

unset custom_path_to_git_prompt
