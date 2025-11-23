# Message-Of-The-Day
#

# Respect .hushlogin file.
if [ ! -e "$HOME/.hushlogin" ]; then

  # Check support for ANSI colours.
  case "$TERM" in xterm-*color)

    # A green-colored block
    b='\e[38;5;10m\e[48;5;10m..\e[0m'

    # The message.
    echo
    echo -e "                    \e[1mHi, \e[32m$(whoami)\e[39m!\e[0m"
    echo
    echo -e "    $b$b    $b$b    A legend once said:"
    echo -e "    $b$b    $b$b"
    echo -e "        $b$b          For what is a man, what has he got"
    echo -e "      $b$b$b$b        If not himself, then he has naught"
    echo -e "      $b    $b        To say the things he truly feels"
    echo -e "                      And not the words of one who kneels"
    echo -e "                      The record shows, I took the blows"
    echo -e "                      And did it, My Way!"
    echo
    echo -e "                      \e[1mFrank Sinatra\e[0m"

    unset b

    # Color palette.
    cnt=0
    while [ "$cnt" -lt 16 ]; do
      [ $((cnt % 8)) -eq 0 ] && printf "\n                    "
      printf "\e[38;5;%sm\e[48;5;%sm..\e[0m" "$cnt" "$cnt"
      cnt=$((cnt + 1))
    done
    printf "\n\n"
    unset cnt

  # Fallback to colorless text
  ;; *) envsubst < "$CUSTOMS/init.d/motd";; esac
fi
