-- PulseAudio/PipeWire volume widget (via pactl)
-- replacement for lain.widget.pulse using pactl

local helpers = require("lain.helpers")
local shell   = require("awful.util").shell
local wibox   = require("wibox")
local string  = string
local type    = type

local function factory(args)
    args           = args or {}

    local pulse    = { widget = args.widget or wibox.widget.textbox(), device = "N/A" }
    local timeout  = args.timeout or 5
    local settings = args.settings or function() end

    pulse.devicetype = args.devicetype or "sink"
    pulse.cmd = args.cmd or [[
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

            volume_now.left  = volume_now.channel[1] or "N/A"
            volume_now.right = volume_now.channel[2] or "N/A"

            widget = pulse.widget
            settings()
        end)
    end

    helpers.newtimer("pulse", timeout, pulse.update)

    return pulse
end

return factory
