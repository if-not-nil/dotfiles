export XDG_CONFIG_HOME=$HOME/.config

have() {
    command -v "$1" >/dev/null 2>&1
}

export EDITOR="nvim"
export MANPAGER="nvim +Man!"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/ext:$PATH" # for stuff i didnt write and symlinks
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

# export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"

if [[ $(uname) == "Linux" ]]; then 
  alias pacman="sudo pacman"
  alias apt="sudo apt"
  alias dnf="sudo dnf"
  alias xbpi="sudo xbps-install"
fi

# finds a bunch of caches
alias _fd_cache_pattern="fd --no-ignore --hidden --type d --absolute-path --regex '(node_modules|\\.npm|cargo/registry|cargo/git|cargo/\\.package-cache|rustup|\\.cache/zig|zig-cache|zig-out)'"
# unalias _fd_cache_pattern
alias fd_caches_echo="_fd_cache_pattern -x echo {}"
alias fd_caches_rm="_fd_cache_pattern -x rm -rf {}"

alias trash="trash -v"
alias cows="lua ~/projects/cli/cow-tools/main.lua"
alias e="$EDITOR"
alias ls="ls -A --color=auto"
alias l="ls"
alias ll="ls -1"
alias li="ls -l"
alias cp="cp -r"
alias ..="cd .."

[[ $- != *i* ]] && return

have zoxide && eval "$(zoxide init bash)"

have yazi && y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}; have y && alias f=y 


PS1='\[\e[33m\]\w\[\e[0m\] λ '
set -o vi

have koghi && koghi

# if [[ -f ~/bin/ext/ble.sh/ble.sh ]]; then
#   source -- ~/bin/ext/ble.sh/ble.sh --attach=none
#   [[ ! ${BLE_VERSION-} ]] || ble-attach
# fi
