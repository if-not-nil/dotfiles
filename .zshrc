PROMPT="%B%F{yellow}%~%f%b ζ "
alias zreload="source ~/.zshrc"

# FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# = aliases =
alias e="$EDITOR"
alias grep="grep --color=auto"
alias ls="ls -A --color=auto"
alias l=ls
alias ll="ls -lAhs --color=auto"
alias ..="cd .."
alias rm="rm -Iv"
alias trash="trash -v"
alias cp="cp -r"

function ln-real() {
    ln $(realpath $1) $2
}

# = integrations =
alias tmac="tmux new-session -A -s main"

eval "$(zoxide init zsh)"

source <(fzf --zsh)
bindkey '^R' fzf-history-widget

# = completion =
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

autoload select-word-style
select-word-style bash # so that it goes by subwords (hyphens, slashes, etc)

setopt menucomplete # suggest on first tab
setopt noautolist # no list if only one cmp
setopt autocd # type dir to cd
setopt auto_param_slash # add slash to dir on cmp 
setopt no_case_glob no_case_match # cmp is case insensitive
# setopt globdots # include dots in cmp
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
stty stop undef # ctrl+s would stop a commands output n this disables it

# = keymaps =
function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
bindkey "^N" history-search-forward
bindkey "^P" history-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "\e\x7f" backward-kill-word

bindkey -M menuselect '^[[Z' reverse-menu-complete
cancel-completion() {
    zle .send-break
}

zle -N cancel-completion

bindkey -M menuselect '\e' cancel-completion
bindkey -M viins '\e' cancel-completion 
bindkey -M emacs '\e' cancel-completion   

# = plugins =
# source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/vi-mode/zsh-vi-mode.plugin.zsh
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
source ~/.zsh/autosuggestions/zsh-autosuggestions.zsh

# = additional stuff =
koghi
