# This script adds some shortcut commands
# in the terminal.

# git shortcuts
alias gs='git status'
alias gll='git log'

# youtube-dl
alias ytdl="yt-dlp -x --audio-format mp3 --audio-quality 320K -o '%(title)s.%(ext)s'"

# other utils
alias lg='ls -AFlhv --group-directories-first'
alias lh='ls -Flhv --group-directories-first'

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

plbsys() {
  echo "Simulating sound system playback..."
  file=$1
  shift
  play "$file" gain -15 echo 1 1 125 .3 bass 15 treble 7 reverb 50 100 100 100 10 -5 "$@"
}
