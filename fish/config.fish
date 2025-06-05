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


  set -gx MANPATH ~/.local/man $MANPATH

  set XDG_CONFIG_HOME /Users/test/.config
  ## aliases
  alias man batman
  # navigation
  alias e=$EDITOR
  alias f=y


  alias l='ls --color=auto -A'
  alias ls='ls --color=auto -A'
  bind \cz 'fg 2>/dev/null; commandline -f repaint' # reopen with C-z
  # utility
  alias dl-ytm="yt-dlp -x --audio-format mp3"
  alias dl-yt="yt-dlp --format mp4"
  source ~/.config/fish/functions/key-bindings.fish
  alias cp="cp -r"

  # zoxide init fish --cmd cd | source

  alias c cd
  set NNN_FCOLORS 8a6449f4647c6434b49ec2af
  # export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

  # Check if our Terminal emulator is Ghostty
  # if [ "$TERM" = "xterm-ghostty" ]
  # Launch zellij
  # eval (zellij setup --generate-auto-start fish | string collect)
  # end
end
