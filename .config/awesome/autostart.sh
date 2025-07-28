#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" 
run "nm-applet" 
run "blueman-applet" 
run "playerctld" daemon
run "unclutter" --timeout 10 --exclude-root

setxkbmap -layout "us" -option "ctrl:nocaps"
