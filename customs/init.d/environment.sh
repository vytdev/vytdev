# Setup the environment.

set +e

# locale
export LANG=en_US.UTF-8

# paths
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
if [ -z "$MANPATH" ] ; then
  export MANPATH="$HOME/.local/man:$HOME/.local/share/man:$(manpath)"
fi

# command history
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups
HISTIGNORE='ls:cd:pwd:exit:clear'
shopt -s histappend

# setup gnupg
export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.gnupg"

# editor and pager
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# git editor and pager
export GIT_EDITOR=vim
export GIT_PAGER=less

# other opts
export LESS="-R"  # show ansi colours in `less`
eval "$(dircolors -b)"

# starting dir
shopt -q login_shell && cd ~/projects

# completions
#. /etc/bash_completion.d/global-python-argcomplete
