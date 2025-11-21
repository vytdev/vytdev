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

# Dynamic detailed prompt.
dyn_ncol='\n┌─[\u@\h]─(\w)$(__git_ps1 " <%s>") [$?] \d \t\n└── \$ '
dyn_wcol='\n\[\e[0m\]\[\e[38;2;128;128;128m\]┌─[\[\e[32m\]\u@\h\[\e[38;2;128;128;128m\]]─(\[\e[33m\]\w\[\e[38;2;128;128;128m\])$(__git_ps1 " <\[\e[35m\]%s\[\e[38;2;128;128;128m\]>") [\[\e[36m\]$?\[\e[38;2;128;128;128m\]] \[\e[34m\]\d \t\n\[\e[38;2;128;128;128m\]└── \[\e[31m\]\$\[\e[0m\] '

# Debian-style prompt.
deb_ncol='\u@\h:\w\$ '
deb_wcol='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[37m\]\$\[\e[0m\] '

# Essentials prompt.
est_ncol='\w[$?]\$ '
est_wcol='\[\e[32m\]\w\[\e[0m\][\[\e[34m\]$?\[\e[0m\]]\[\e[33m\]\$\[\e[0m\] '

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
  PS1=$deb_wcol
else
  PS1=$deb_ncol
fi

unset colorize

unset dyn_ncol
unset dyn_wcol
unset deb_ncol
unset deb_wcol
unset est_ncol
unset est_wcol

unset custom_path_to_git_prompt
