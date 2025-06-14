local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

config.colors = require("theme")
config.keys = require("keys")

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

config.window_decorations = "RESIZE"
-- wezterm.plugin
-- 	.require("https://github.com/yriveiro/wezterm-tabs")
-- 	.apply_to_config(config, { tabs = { tab_bar_at_bottom = true } })
require("tabs")(wezterm, config)

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = "0pt",
	right = "0pt",
	top = "0pt",
	bottom = "0pt",
}

config.font_size = 24.0
config.font = wezterm.font("Terminess Nerd Font Mono")
-- config.font = wezterm.font("Maple Mono Normal NL NF")
config.font_shaper = "Harfbuzz"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
