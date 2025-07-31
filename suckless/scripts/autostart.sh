#!/bin/sh

procs=(
  "unclutter:unclutter"
  "dunst:dunst"
  "blueman-applet:blueman-applet"
  "nm-applet:nm-applet"
)

for entry in "${procs[@]}"; do
  name="${entry%%:*}"
  cmd="${entry#*:}"
  if ! pgrep -x "$name" > /dev/null; then
    eval "$cmd &"
  fi
done
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
setxkbmap -layout "us" -option "ctrl:nocaps"
~/suckless/flexipatch-dwm/generate-xresources.sh
killall dwmblocks; ~/suckless/bin/dwmblocks &
