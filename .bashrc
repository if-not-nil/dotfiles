export XDG_CONFIG_HOME=$HOME/.config

# dont want my hostname leaked
# if [[ $(hostname | sha1) == "094ec9e6d3c3d0d4dd00e56473b3c765237a1439" ]]; then
#   export HELIX_RUNTIME=~/bin/ext/helix-runtime/
# fi

export EDITOR="nvim"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/ext:$PATH" # for stuff i didnt write and symlinks
case $(uname) in
  Darwin)
    export PATH="/opt/homebrew/bin:$PATH"
esac

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export PATH="$HOME/.bun/bin:$PATH"
# export PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"

# finds a bunch of caches
alias pacman="sudo pacman"
alias _fd_cache_pattern="fd --no-ignore --hidden --type d --absolute-path --regex '(node_modules|\\.npm|cargo/registry|cargo/git|cargo/\\.package-cache|rustup|\\.cache/zig|zig-cache|zig-out)'"
alias fd_caches_echo="_fd_cache_pattern -x echo {}"
alias fd_caches_rm="_fd_cache_pattern -x rm -rf {}"

alias trash="trash -v"
alias man="batman"
alias cows="lua ~/projects/cli/cow-tools/main.lua"
alias e="$EDITOR"
alias ls="ls -A --color=auto"
alias l="ls"
alias ll="ls -1"
alias li="ls -l"
alias cp="cp -r"
alias ..="cd .."

[[ $- != *i* ]] && return
source -- ~/bin/ext/ble.sh/ble.sh --attach=none
# eval "$(zoxide init bash)" 

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
alias f=y

PS1='\[\e[93m\]\w\[\e[0m\] λ '
set -o vi

# ~/bin/koghi

[[ ! ${BLE_VERSION-} ]] || ble-attach
