# This script adds some shortcut commands
# in the terminal.

s="equalizer 500 10q -20 gain -4 bass 5 compand 3,60 -10,0 reverb 50 50 100 100 20"


# git shortcuts
alias gs='git status'
alias gll='git log'

# youtube-dl
alias ytdl="yt-dlp -x --audio-format mp3 --audio-quality 320K -o '%(title)s.%(ext)s'"
alias ytvd="yt-dlp -f 'bv*+ba/best' --merge-output-format mp4 -o '%(title)s.%(ext)s'"
alias ytav="yt-dlp -f 'bestvideo[height<=720]+bestaudio/best[abr>=160]' -o '%(title)s.%(ext)s'"

# py env shortcut
alias pyev="source /root/.python-venv/bin/activate"

# other utils
alias lg='ls -AFlhv --group-directories-first'
alias lh='ls -Flhv --group-directories-first'
alias m="eval \"\$(history | sed 's/^[0-9 ]*//' | fzf)\""

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

plvid() {
  echo "Playing audio part..."
  vid="$1"
  shift
  ffmpeg -i "$vid" -vn -f wav - 2>/dev/null | sox -t wav - -d "$@"
}
