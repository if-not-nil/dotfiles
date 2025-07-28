local awful     = require("awful")

return awful.widget.watch(
  { awful.util.shell, "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed -n '/present/,/icon-name/p'" },
  30,
  function(widget, stdout)
    for k, v in string.gmatch(stdout, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
      if k == "percentage" then
        widget:set_text(tonumber(v).."%")
        return
      end
    end
    widget:set_text("bat N/A")
  end
)
