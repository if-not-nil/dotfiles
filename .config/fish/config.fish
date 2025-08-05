if status is-interactive
    # homebrew manpaths on mac dont work
    set -gx MANPATH /usr/local/share/man:/usr/local/man:/opt/homebrew/share/man:/Users/test/.local/share/man:/Users/test/.local/man:/usr/share/man:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man:/Library/Developer/CommandLineTools/usr/share/man

    fish_add_path /opt/homebrew/bin
    fish_add_path ~/go/bin
    fish_add_path ~/.bun/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/bin
    fish_add_path ~/bin/ext
    fish_add_path ~/.local/bin

    type -q zoxide; and zoxide init fish | source
    set -x MANPAGER "nvim +Man!"
    # aliases
    if set -q ZELLIJ_SESSION_NAME
        bind alt-e "cd (zellij pipe -p filepicker)"
    end
    alias tmac="tmux new-session -A -s main"
    # alias tmad="tmux new-session -A -s"

    set -gx EDITOR nvim
    alias e="$EDITOR"

    alias c="cd"
    alias cp="cp -r"
    alias cows="~/projects/cli/lunar/cows/cows.lua"
    alias freload="source ~/.config/fish/config.fish"
    alias l='ls --color=auto -A'
    alias ls='ls --color=auto -A'
    alias ll='ls -l --color=auto -A'
    type -q pacman; and alias pacman="sudo pacman"

    bind \cz 'fg 2>/dev/null; commandline -f repaint' # reopen with C-z

    # utility
    alias dl-ytm="yt-dlp -x --audio-format mp3"
    alias dl-yt="yt-dlp --format mp4"
    alias venv="source .venv/bin/activate.fish"
    bind alt-v fish_clipboard_paste

    bind ctrl-h backward-kill-word
    bind super-backspace backward-kill-word
    bind ctrl-e edit_command_buffer
    if type -q yazi
        function y
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            yazi $argv --cwd-file="$tmp"
            if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                builtin cd -- "$cwd"
            end
            rm -f -- "$tmp"
        end
        alias f=y
    end

end
