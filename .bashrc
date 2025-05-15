CUSTOMS_HOME=~/vytdev/customs
source "$CUSTOMS_HOME/source-sh"
export STARSHIP_CONFIG=~/vytdev/starship.toml

export PATH="$HOME/.cargo/bin:$PATH"

source /usr/share/doc/pkgfile/command-not-found.bash

fancy() {
  eval "$(starship init bash)"
}
