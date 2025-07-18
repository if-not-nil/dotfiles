local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

config.colors = require("theme")
-- config.color_scheme = "GruvboxDarkHard"
config.keys = require("keys")

config.default_prog = { "/opt/homebrew/bin/bash" }

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
wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%b %-d, %H:%M ")

	window:set_right_status(wezterm.format({
		{ Text = date },
	}))
end)
config.audible_bell = "Disabled"
config.font_size = 24.0
-- config.font = wezterm.font("Terminus (TTF)")
config.font = wezterm.font("Terminess Nerd Font Mono")
-- config.font = wezterm.font("Maple Mono Normal NL NF")
config.font_shaper = "Harfbuzz"
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
-- config.cell_width = {
-- 	{ first = 0xe000, last = 0xf8ff, width = 2 },
-- 	{ first = 0xf0000, last = 0xf1fff, width = 2 },
-- }
return config
