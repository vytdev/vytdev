# Message-Of-The-Day
#

echo
echo "  Hi, vytdev!"
echo
echo "  A legend once said:"
echo
echo "    For what is a man, what has he got"
echo "    If not himself, then he has naught"
echo "    To say the things he truly feels"
echo "    And not the words of one who kneels"
echo "    The record shows, I took the blows"
echo "    And did it, My Way!"
echo
echo "    -- Frank Sinatra"

# Color palette.
cnt=0
while [ "$cnt" -lt 16 ]; do
  [ $((cnt % 8)) -eq 0 ] && printf "\n    "
  printf "\033[48;5;%sm  \033[0m" "$cnt"
  cnt=$((cnt + 1))
done
printf "\n\n"
unset cnt
