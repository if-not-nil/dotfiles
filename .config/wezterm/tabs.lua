return function(wezterm, config)
  local colors = config.colors
  config.tab_bar_at_bottom = false
  config.use_fancy_tab_bar = false

  local function tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
      return title
    end
    return tab_info.active_pane.title
  end

  wezterm.on('format-tab-title', function(tab, tabs, panes, cfg, hover, max_width)
    local title = tab_title(tab)
    title = string.format(' %d: %s ', tab.tab_index + 1, title)
    if tab.is_active then
      return {
        {Text = title},
      }
    end
    return {
      {Text = title},
    }
  end)
  config.colors.tab_bar = {
    background = colors.background,
    active_tab = {
      bg_color = colors.background,
      fg_color = colors.foreground,
      intensity = 'Bold',
      -- underline = 'Single',
    },
    inactive_tab = {
      bg_color = colors.background,
      fg_color = colors.brights[1],
    },
    new_tab = {
      bg_color = colors.background,
      fg_color = colors.background,
    },
  }
  -- wezterm.on("update-right-status", function(window, pane)
  -- 	-- "Wed Mar 3 08:14"
  -- 	local date = wezterm.strftime("%b %-d, %H:%M ")
  --
  -- 	window:set_right_status(wezterm.format({
  -- 		{ Text = date },
  -- 	}))
  -- end)
end
