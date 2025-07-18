local wezterm = require("wezterm") --[[@as Wezterm]]
local act = wezterm.action

return {
	-- { key = "F1", action = act.DecreaseFontSize },
	{ key = "Backspace", mods = "CMD", action = act.SendKey({ key = "w", mods = "CTRL" }) },
	{ key = "Backspace", mods = "CMD|SHIFT", action = act.SendKey({ key = "u", mods = "CTRL" }) },

	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },

	-- { key = "2", mods = "CMD", action = act.ActivateTabRelative(1) },
	-- { key = "1", mods = "CMD", action = act.ActivateTabRelative(-1) },
	--
	{ key = "1", mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "2", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "[", mods = "CMD", action = act.MoveTabRelative(-1) },
	{ key = "]", mods = "CMD", action = act.MoveTabRelative(1) },

	{ key = "Enter", mods = "CMD", action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
	{ key = "Enter", mods = "SHIFT|CMD", action = act.SplitPane({ direction = "Left", size = { Percent = 50 } }) },

	{ key = "h", mods = "CMD", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "CMD", action = act.AdjustPaneSize({ "Right", 5 }) },

	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Prev") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Next") },

	{ key = "j", mods = "CMD|SHIFT", action = act.RotatePanes("CounterClockwise") },
	{ key = "k", mods = "CMD|SHIFT", action = act.RotatePanes("Clockwise") },
}
