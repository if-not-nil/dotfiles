function fdc
    set selected (fd . ~/.config --type f --exclude node_modules --exclude .git --exclude StardewValley | fzf)
    if test -n "$selected"
        $EDITOR "$selected"
    end
end
