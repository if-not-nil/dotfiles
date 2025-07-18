[[ $- == *i* ]] && source -- ~/bin/ext/ble.sh/ble.sh --attach=none

export XDG_CONFIG_HOME=/Users/test/.config
export HELIX_RUNTIME=~/bin/ext/helix-runtime/
export EDITOR="/opt/homebrew/bin/nvim"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/ext:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"

# finds a bunch of caches
alias _fd_cache_pattern="fd --no-ignore --hidden --type d --absolute-path --regex '(node_modules|\\.npm|cargo/registry|cargo/git|cargo/\\.package-cache|rustup|\\.cache/zig|zig-cache|zig-out)'"
alias fd_caches_echo="_fd_cache_pattern -x echo {}"
alias fd_caches_rm="_fd_cache_pattern -x rm -rf {}"

alias trash="trash -v"
alias man="batman"
alias cows="lua /Users/test/projects/cli/cow-tools/main.lua"
alias e="$EDITOR"
alias ls="ls -A --color=auto"
alias l="ls"
alias ll="ls -1"
alias li="ls -l"
alias ..="cd .."
function f() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
c() {
  if [ -f "$1" ]; then
    "${EDITOR:-nano}" "$1"
  else
    cd "${1:-$HOME}"
  fi
}

alias cp="cp -r"


PS1='\[\e[93m\]\w\[\e[0m\] λ '

~/bin/koghi
set -o vi
# bind 'set show-mode-in-prompt on'
# bind 'set vi-ins-mode-string "i|"'
# bind 'set vi-cmd-mode-string "N|"'
[[ ! ${BLE_VERSION-} ]] || ble-attach
