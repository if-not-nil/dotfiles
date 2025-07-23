local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

---@diagnostic disable-next-line: missing-fields
config = {
	colors = require("theme"),
	enable_wayland = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = "0pt",
		right = "0pt",
		top = "0pt",
		bottom = "0pt",
	},
	audible_bell = "Disabled",
	font_size = 18.0,
	font = wezterm.font("Maple Mono Normal NL NF"),
	font_shaper = "Harfbuzz",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}

if string.find(wezterm.target_triple, "linux") then
elseif string.find(wezterm.target_triple, "darwin") then
	config.default_prog = { "/opt/homebrew/bin/bash" } -- the newer one
	config.window_decorations = "RESIZE"
end

require("tabs")(wezterm, config)
require("keys")(wezterm, config)
-- require("plugins")(wezterm, config)

return config
