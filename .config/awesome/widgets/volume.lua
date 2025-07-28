--[[

     PipeWire volume widget using pactl
     Replaces the old PulseAudio pacmd-based version
     Licensed under GNU General Public License v2
     (c) 2025, Adapted from lain by OpenAI/you

--]]

local helpers = require("lain.helpers")
local shell   = require("awful.util").shell
local wibox   = require("wibox")
local string  = string
local type    = type

local function factory(args)
  args             = args or {}
  local timeout    = args.timeout or 1
  local settings   = args.settings or function() end

  local pulse      = {}
  pulse.widget     = wibox.widget({
    halign = "center",
    valign = "center",
    widget = wibox.widget.textbox
  })
  pulse.device     = "N/A"

  pulse.devicetype = args.devicetype or "sink"
  pulse.cmd        = args.cmd or [[
        pactl list sinks |
        awk '
            BEGIN { ignore = 1 }
            /^\s*Sink #/ { ignore = 0 }
            /^$/ { ignore = 1 }
            !ignore
        '
    ]]

  function pulse.update()
    helpers.async({ shell, "-c", type(pulse.cmd) == "string" and pulse.cmd or pulse.cmd() },
      function(s)
        volume_now = {
          index  = string.match(s, "Sink #(%d+)") or "N/A",
          device = string.match(s, "Name: ([%S]+)") or "N/A",
          muted  = string.match(s, "Mute: (%S+)") or "N/A"
        }

        pulse.device = volume_now.device

        local ch = 1
        volume_now.channel = {}
        for v in string.gmatch(s, "Volume:[^\n]- (%d?%d?%d)%%") do
          volume_now.channel[ch] = v
          ch = ch + 1
        end

        local widget = pulse.widget
        volume_now.left  = volume_now.channel[1] or "N/A"
        volume_now.right = volume_now.channel[2] or "N/A"

        local vol        = tonumber(volume_now.left) or 0
        local icon       = "󰕾"
        if volume_now.muted == "yes" then
          icon = "󰝟"
        elseif vol <= 30 then
          icon = "󰖀"
        elseif vol <= 70 then
          icon = "󰕾"
        else
          icon = "󰕿"
        end

        widget:set_markup(string.format("%s %s%% ", icon, volume_now.left))
        settings()
      end)
  end

  helpers.newtimer("pulse", timeout, pulse.update)

  return pulse
end

return factory
