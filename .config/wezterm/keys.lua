return function(wezterm, config)
	local act = wezterm.action

	local mod = "ALT"
	local mod_shift = "ALT|SHIFT"

	local is_darwin = string.find(wezterm.target_triple, "darwin") ~= nil
	if is_darwin then
		mod = "CMD"
		mod_shift = "CMD|SHIFT"
	end

	local resize_amount = 5
	local layouts = require("layouts")
	config.keys = {
		{ key = "Enter", mods = mod, action = wezterm.action_callback(layouts.bsp) },
		{ key = "Enter", mods = mod_shift, action = wezterm.action_callback(layouts.bsp_reverse) },
		{ key = "Backspace", mods = mod, action = act.SendKey({ key = "w", mods = "CTRL" }) },
		{
			key = "r",
			mods = mod,
			action = act.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},

		{ key = "w", mods = mod, action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "t", mods = mod, action = act.SpawnTab("CurrentPaneDomain") },

		{ key = "[", mods = mod, action = act.MoveTabRelative(-1) },
		{ key = "]", mods = mod, action = act.MoveTabRelative(1) },

		{ key = "j", mods = mod, action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = mod, action = act.ActivatePaneDirection("Up") },
		{ key = "h", mods = mod, action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = mod, action = act.ActivatePaneDirection("Right") },

		{ key = "j", mods = mod_shift, action = act.RotatePanes("CounterClockwise") },
		{ key = "k", mods = mod_shift, action = act.RotatePanes("Clockwise") },
	}
	if is_darwin then
		local overrides = {
			{
				key = ",",
				mods = "CMD",
				action = act.SpawnCommandInNewTab({
					args = { "/Users/test/bin/cfed.lua" },
					-- cwd = "~/.config/wezterm",
				}),
				set_environment_variables = {
					EDITOR = "nvim",
				},
			},
			{ key = "j", mods = "CMD|CTRL", action = act.ActivatePaneDirection("Down") },
			{ key = "k", mods = "CMD|CTRL", action = act.ActivatePaneDirection("Up") },
			{ key = "h", mods = "CMD|CTRL", action = act.ActivatePaneDirection("Left") },
			{ key = "l", mods = "CMD|CTRL", action = act.ActivatePaneDirection("Right") },
		}
		for _, key in pairs(overrides) do
			table.insert(config.keys, key)
		end
	else
		local overrides = {
			{ key = "Tab", mods = mod, action = act.ActivateTabRelative(-1) },
			{ key = "v", mods = mod, action = act.PasteFrom("Clipboard") },
		}
		for i = 1, 9, 1 do
			table.insert(overrides, { key = tostring(i), mods = mod, action = act.ActivateTab(i - 1) })
		end
		for _, key in pairs(overrides) do
			table.insert(config.keys, key)
		end
	end
	config.key_tables = {
		resize_pane = {
			{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", resize_amount }) },
			{ key = "h", action = act.AdjustPaneSize({ "Left", resize_amount }) },

			{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", resize_amount }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", resize_amount }) },

			{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", resize_amount }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", resize_amount }) },

			{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", resize_amount }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", resize_amount }) },

			-- Cancel the mode by pressing escape
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "r", mods = mod, action = "PopKeyTable" },
		},
	}
end
