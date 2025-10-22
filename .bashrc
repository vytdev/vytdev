CUSTOMS_HOME=~/vytdev/customs
source "$CUSTOMS_HOME/source-sh"
export STARSHIP_CONFIG=~/vytdev/starship.toml

export PATH="$HOME/.cargo/bin:~/vytdev/scripts:$PATH"

source /usr/share/doc/pkgfile/command-not-found.bash

fancy() {
  eval "$(starship init bash)"
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
