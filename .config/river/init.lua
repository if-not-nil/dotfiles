#!/usr/bin/env lua

local home = os.getenv("HOME")
-- os.execute(
--   "echo -ne '#!/bin/sh\nriverctl set-focused-tags 1' > ~/.local/share/last_tag; chmod +x ~/.local/share/last_tag\n")

local binds = {
  normal = {
    { "Super",             "Return",                'spawn "foot -e zellij"' },
    { "Super",             "Space",                 'spawn "foot --fullscreen ~/bin/drun.lua"' },
    { "Super",             "Q",                     "close" },
    { "Super+Shift",       "Q",                     "exit" },
    { "Super",             "J",                     "focus-view next" },
    { "Super",             "K",                     "focus-view previous" },
    { "Super+Shift",       "J",                     "swap next" },
    { "Super+Shift",       "K",                     "swap previous" },
    { "Super",             "Period",                "focus-output next" },
    { "Super",             "Comma",                 "focus-output previous" },
    { "Super+Shift",       "Period",                "send-to-output next" },
    { "Super+Shift",       "Comma",                 "send-to-output previous" },
    { "Super+Alt",         "H",                     "move left 100" },
    { "Super+Alt",         "J",                     "move down 100" },
    { "Super+Alt",         "K",                     "move up 100" },
    { "Super+Alt",         "L",                     "move right 100" },
    { "Super+Alt+Control", "H",                     "snap left" },
    { "Super+Alt+Control", "J",                     "snap down" },
    { "Super+Alt+Control", "K",                     "snap up" },
    { "Super+Alt+Control", "L",                     "snap right" },
    { "Super",             "F11",                   "enter-mode passthrough",                                       "normal" },
    { "Super",             "H",                     'send-layout-cmd rivercarro "main-ratio -0.05"' },
    { "Super",             "L",                     'send-layout-cmd rivercarro "main-ratio +0.05"' },
    { "Super+Shift",       "H",                     'send-layout-cmd rivercarro "main-count +1"' },
    { "Super+Shift",       "L",                     'send-layout-cmd rivercarro "main-count -1"' },
    { "Super",             "Up",                    'send-layout-cmd rivercarro "main-location top"' },
    { "Super",             "Right",                 'send-layout-cmd rivercarro "main-location right"' },
    { "Super",             "Down",                  'send-layout-cmd rivercarro "main-location bottom"' },
    { "Super",             "Left",                  'send-layout-cmd rivercarro "main-location left"' },
    { "Super",             "M",                     'send-layout-cmd rivercarro "main-location monocle"' },
    { "Super",             "W",                     'send-layout-cmd rivercarro "main-location-cycle left,monocle"' },
    { "None",              "XF86AudioRaiseVolume",  'spawn "pamixer -i 5"' },
    { "None",              "XF86AudioLowerVolume",  'spawn "pamixer -d 5"' },
    { "None",              "XF86AudioMute",         'spawn "pamixer --toggle-mute"' },
    { "None",              "XF86AudioPlay",         'spawn "playerctl play-pause"' },
    { "None",              "XF86AudioPrev",         'spawn "playerctl previous"' },
    { "None",              "XF86AudioNext",         'spawn "playerctl next"' },
    { "None",              "XF86MonBrightnessUp",   'spawn "brightnessctl set +5%"' },
    { "None",              "XF86MonBrightnessDown", 'spawn "brightnessctl set 5%-"' },
  },
  passthrough = {
    { "Super", "F11", "enter-mode normal" },
  },
  locked = {
    -- media and brightness keys
    { "None", "XF86AudioRaiseVolume",  "spawn pamixer -i 5" },
    { "None", "XF86AudioLowerVolume",  "spawn pamixer -d 5" },
    { "None", "XF86AudioMute",         "spawn pamixer --toggle-mute" },
    { "None", "XF86AudioPlay",         'spawn "playerctl play-pause"' },
    { "None", "XF86AudioPrev",         'spawn "playerctl previous"' },
    { "None", "XF86AudioNext",         'spawn "playerctl next"' },
    { "None", "XF86MonBrightnessUp",   'spawn "brightnessctl set +5%"' },
    { "None", "XF86MonBrightnessDown", 'spawn "brightnessctl set 5%-"' },
  },
}

for i = 1, 9, 1 do
  local tags = 1 << (i - 1)
  table.insert(binds.normal, { mod = "Super", key = tostring(i), cmd = "set-focused-tags " .. tags })
end

local settings = {
  -- General settings
  ["background-color"] = "0x000000",
  ["border-color-focused"] = "0x93a1a1",
  ["border-color-unfocused"] = "0x284e55",
  ["set-repeat"] = { 30, 200 },
  ["keyboard-layout"] = {
    layout = "us",
    options = "ctrl:nocaps"
  },
  ["focus-follows-cursor"] = "enable",

  -- Layout
  ["default-layout"] = "rivercarro",
}

local input_settings = {
  ["pointer-2-7-SynPS/2_Synaptics_TouchPad"] = {
    tap = "enabled",
    ["disable-while-typing"] = "disabled",
    ["scroll-factor"] = 0.8,
  }
}

local rules = {
  { title = "Volume Control",    action = "float" },
  { title = "Bluetooth Devices", action = "float" },
}

local autostart = {
  '$HOME/.config/river/creek.sh',
  '$HOME/.config/river/carro.sh',
}

local function apply_settings()
  for k, v in pairs(settings) do
    if k == "set-repeat" then
      os.execute("riverctl set-repeat " .. v[1] .. " " .. v[2])
    elseif k == "keyboard-layout" then
      os.execute(string.format('riverctl keyboard-layout -options "%s" %s', v.options, v.layout))
    else
      os.execute("riverctl " .. k .. " " .. v)
    end
  end
end

local function apply_input_settings()
  for device, props in pairs(input_settings) do
    for prop, val in pairs(props) do
      os.execute(string.format("riverctl input %s %s %s", device, prop, val))
    end
  end
end

local function apply_rules()
  for _, rule in ipairs(rules) do
    os.execute(string.format('riverctl rule-add -title "%s" %s', rule.title, rule.action))
  end
end

local function run_autostart()
  for _, cmd in ipairs(autostart) do
    os.execute("riverctl spawn " .. cmd)
  end
end


-- local inspect = require("inspect").inspect
local function apply_keybinds()
  for mode, set in pairs(binds) do
    if mode ~= "normal" then os.execute("riverctl declare-mode " .. mode) end
    for _, bind in ipairs(set) do
      local mod, key, cmd = bind[1], bind[2], bind[3]
      -- print(inspect(bind))
      local shellcmd = string.format("riverctl map %s %s %s %s", mode, mod, key, cmd)

      os.execute(shellcmd)
    end
  end
end

apply_settings()
apply_keybinds()
apply_input_settings()
apply_rules()
run_autostart()
