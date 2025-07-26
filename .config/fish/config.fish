if status is-interactive
  ### set
  # for self-built only
  # opts
  set -gx EDITOR nvim
  # path

  set -gx PATH /opt/homebrew/bin/ $PATH
  set -gx PATH ~/bin/ $PATH
  set -gx PATH ~/bin/ext $PATH
  set -gx PATH ~/.local/bin $PATH
  zoxide init fish | source
  batman --export-env | source
  ## aliases
  if set -q ZELLIJ_SESSION_NAME
    bind alt-e "cd (zellij pipe -p filepicker)"
  end
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
  bind --preset --erase alt-v
  bind ctrl-h 'backward-kill-word'
  bind ctrl-e 'edit_command_buffer'
end
