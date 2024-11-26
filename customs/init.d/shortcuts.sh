# This script adds some shortcut commands
# in the terminal.

# git shortcuts
alias gs='git status'
alias gll='git log'

# youtube-dl
alias ytdl="yt-dlp -x --audio-format mp3 --audio-quality 320K -o '%(title)s.%(ext)s'"

# other utils
alias lg='ls -AFlhv --group-directories-first'

mkcd() {
  mkdir -p "$1"
  cd "$1"
}

clh() {
  printf 'Are you sure you want to reset your command history? [y/n]: '
  read ans
  case "$ans" in
    y* | '')
      history -c
      history -w
      clear
      echo "Your command history were reset."
      ;;
    * )
      echo "Canceled."
      ;;
  esac
}
