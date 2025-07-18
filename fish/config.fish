if status is-interactive
  ### set
  # for self-built only
  export HELIX_RUNTIME=~/git/helix/runtime
  # opts
  set -gx EDITOR nvim
  # path
  source "$HOME/.cargo/env.fish"

  set -gx PATH /opt/homebrew/bin/ $PATH
  set -gx PATH /usr/local/bin/ $PATH
  set -gx PATH ~/go/bin/ $PATH
  set -gx PATH ~/bin/ $PATH
  set -gx PATH ~/bin/ext $PATH
  set -gx PATH /opt/homebrew/bin/ $PATH
  set -gx PATH ~/.bun/bin/ $PATH
  set -gx PATH ~/.local/bin $PATH
  set -gx PATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin $PATH


  set -gx MANPATH ~/.local/man $MANPATH

  set -gx HOMEBREW_NO_AUTO_UPDATE
  alias cows="lua ~/projects/cli/cow-tools/main.lua"
  set XDG_CONFIG_HOME /Users/test/.config
  ## aliases
  alias f=y # yazi
  alias man batman

  # files
  alias l="eza"
  alias ls="eza -a"
  alias c="cd" 
  alias cp="cp -r"

  alias e=$EDITOR


  # alias l='ls --color=auto -A'
  # alias ls='ls --color=auto -A'
  bind \cz 'fg 2>/dev/null; commandline -f repaint' # reopen with C-z
  # utility
  alias dl-ytm="yt-dlp -x --audio-format mp3"
  alias dl-yt="yt-dlp --format mp4"
  source ~/.config/fish/functions/key-bindings.fish
end
