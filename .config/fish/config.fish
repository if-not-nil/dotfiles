if status is-interactive
  ### set
  # for self-built only
  # opts
  set -gx EDITOR nvim
  # path

  set -gx PATH ~/bin/ $PATH
  set -gx PATH ~/bin/ext $PATH
  set -gx PATH ~/.local/bin $PATH

  zoxide init fish | source
  batman --export-env | source
  ## aliases

  # files

  alias c="cd" 
  alias cp="cp -r"

  alias e=$EDITOR


  alias pacman="sudo pacman"
  alias l='ls --color=auto -A'
  alias ls='ls --color=auto -A'
  bind \cz 'fg 2>/dev/null; commandline -f repaint' # reopen with C-z
  # utility
  alias dl-ytm="yt-dlp -x --audio-format mp3"
  alias dl-yt="yt-dlp --format mp4"
end
