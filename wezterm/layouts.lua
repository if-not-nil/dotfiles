return {
	bsp = function(window, pane)
		local d = pane:get_dimensions()
		local dir = d["pixel_height"] < d["pixel_width"] and "Right" or "Bottom"
		pane:split({ direction = dir })
	end,
	bsp_reverse = function(window, pane)
		local d = pane:get_dimensions()
		local dir = d["pixel_height"] < d["pixel_width"] and "Left" or "Top"
		pane:split({ direction = dir })
	end,
}
