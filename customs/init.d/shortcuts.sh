# This script adds some shortcut commands
# in the terminal.


# i use nvim
alias code='nvim'

# git shortcuts
alias gs='git status'
alias gll='git log'
alias gad='git add'
alias gdf='git diff'
alias gc='git commit'

# youtube-dl
alias ytdl="yt-dlp -x --audio-format mp3 --audio-quality 320K -o '%(title)s.%(ext)s'"
alias ytvd="yt-dlp -f 'bv*+ba/best' --merge-output-format mp4 -o '%(title)s.%(ext)s'"
alias ytav="yt-dlp -f 'bestvideo[height<=720]+bestaudio/best[abr>=160]' -o '%(title)s.%(ext)s'"

# py env shortcut
#alias pyev="source /root/.python-venv/bin/activate"

# colorise ls
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# other utils
alias ll='ls -l'
alias la='ls -la'
alias lg='ls -AFlhv --group-directories-first'
alias lh='ls -Flhv --group-directories-first'

# fuzzy find prev cmd
alias m="eval \"\$(history | tac | sed 's/^[0-9 ]*//' | fzf)\""

# my sox presets (when i'm listening music)
s_bass="equalizer 500 10q -20 gain -4 bass 5 compand 3,60 -10,0"
s_snd="gain -15 echo 1 1 125 .3 bass 15 treble 7 reverb 50 100 100 100 10 -5"


# fused mkdir + cd
mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# clear cmd history
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

# used to play .mp4 files
plvid() {
  echo "Playing audio part..."
  vid="$1"
  shift
  ffmpeg -i "$vid" -vn -f wav - 2>/dev/null | sox -t wav - -d "$@"
}
