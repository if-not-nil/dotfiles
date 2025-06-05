function fdp
    set selected (fd . ~/projects --type d --exclude node_modules --exclude .git --exclude venv | fzf)
    if test -n "$selected"
        cd "$selected"
    end
end

