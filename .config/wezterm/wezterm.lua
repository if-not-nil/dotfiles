local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

---@diagnostic disable-next-line: missing-fields
config = {
	colors = wezterm.color.load_base16_scheme(wezterm.config_dir .. "/base16-default-bark.yaml"),
	-- color_scheme = 'Default Dark (base16)',
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
	default_prog = { "fish" },
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}
-- config.colors.tab_bar.background = '#000000'
print(config.colors)

if string.find(wezterm.target_triple, "linux") then
	-- idk
	-- config.enable_wayland = false
	config.font_size = 14.0
-- config.font = wezterm.font('Terminess Nerd Font')
elseif string.find(wezterm.target_triple, "darwin") then
	config.default_prog = { "/opt/homebrew/bin/fish" }
	config.window_decorations = "RESIZE"
end

require("tabs")(wezterm, config)
require("keys")(wezterm, config)
-- require("plugins")(wezterm, config)

return config
