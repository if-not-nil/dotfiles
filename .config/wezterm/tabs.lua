return function(wezterm, config)
	-- local colors = config.colors.tab_bar
	config.tab_bar_at_bottom = false
	config.use_fancy_tab_bar = false

	local function tab_title(tab_info)
		local title = tab_info.tab_title
		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end
		-- Otherwise, use the title from the active pane
		-- in that tab
		return tab_info.active_pane.title
	end

	wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
		local title = tab_title(tab)
		-- current_working_dir is a URI string like "file:///home/user/projects"
		-- So we strip the "file://" prefix and decode URL escapes
		-- title = string.format(" %s ", title)
		title = string.format(" %d: %s ", tab.tab_index + 1, title)
		if tab.is_active then
			return {
				-- { Background = { Color = colors.active_tab.bg_color } },
				-- { Foreground = { Color = colors.active_tab.fg_color } },
				{ Text = title },
			}
		end

		-- Green color and append '*' to previously active tab.
		return {
			-- { Background = { Color = colors.inactive_tab.bg_color } },
			-- { Foreground = { Color = colors.inactive_tab.fg_color } },
			{ Text = title },
		}
	end)
	-- wezterm.on("update-right-status", function(window, pane)
	-- 	-- "Wed Mar 3 08:14"
	-- 	local date = wezterm.strftime("%b %-d, %H:%M ")
	--
	-- 	window:set_right_status(wezterm.format({
	-- 		{ Text = date },
	-- 	}))
	-- end)
end
