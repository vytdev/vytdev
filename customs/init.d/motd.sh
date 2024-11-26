# Message-Of-The-Day
#

name=`whoami`
host=`hostname`
date=`date "+%A, %d %B %Y, %H:%M:%S"`
up=`uptime -p`
load=`uptime | awk -F'load average:' '{print $2 " (1/5/15)"}' | xargs`
disk=`df -h / | awk 'NR==2 {print $5 " used"}'`
mem=`free -h | awk '/^Mem:/ {print $3 "/" $2 " used"}'`

echo
printf "  Welcome, \033[33m%s\033[0m!\n"  "$name"
printf "  Host:   \033[33m%s\033[0m\n"    "$host"
printf "  Date:   \033[32m%s\033[0m\n"    "$date"
printf "  Uptime: \033[35m%s\033[0m\n"    "$up"
printf "  Load:   \033[34m%s\033[0m\n"    "$load"
printf "  Disk:   \033[36m%s\033[0m\n"    "$disk"
printf "  Mem:    \033[36m%s\033[0m\n"    "$mem"

unset name
unset host
unset date
unset up
unset load
unset disk
unset mem

# Color palette.
cnt=0
while [ "$cnt" -lt 16 ]; do
  [ $((cnt % 8)) -eq 0 ] && printf "\n    "
  printf "\033[48;5;%sm  \033[0m" "$cnt"
  cnt=$((cnt + 1))
done
echo
unset cnt
