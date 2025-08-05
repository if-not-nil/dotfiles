require("init")

if vim.g.neovide then
    vim.o.guifont = "Terminess Nerd Font Mono:h20"
    vim.g.neovide_macos_simple_fullscreen = true
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    vim.g.neovide_cursor_animation_length = 0
end
