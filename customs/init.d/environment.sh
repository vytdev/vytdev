# Setup the environment.

set +e

export LANG=en_US.UTF-8

# paths
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
if [ -z "$MANPATH" ] ; then
  export MANPATH="$HOME/.local/man:$HOME/.local/share/man:$(manpath)"
fi

# command history
export HISTSIZE=5000
export HISTFILESIZE=10000

# setup gnupg
export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.gnupg"

# some scripts might expect vim..
export EDITOR=vim
export VISUAL=vim

# more or less...
export PAGER=less

# starting dir
shopt -q login_shell && cd ~/projects

#. /etc/bash_completion.d/global-python-argcomplete
