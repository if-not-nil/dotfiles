local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

config.keys = require("keys")
config.colors = require("theme")

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.font_size = 18.0

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = "0pt",
	right = "0pt",
	top = "0pt",
	bottom = "0pt",
}

config.font_shaper = "Harfbuzz"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
