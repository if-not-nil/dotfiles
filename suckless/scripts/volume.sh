#!/bin/bash

sink="@DEFAULT_AUDIO_SINK@"
step=0.05
action="$1"

current=$(wpctl get-volume "$sink" | awk '{print $2}')

case "$action" in
  up)
    new=$(echo "$current + $step" | bc)
    max=1.0
    if (( $(echo "$new > $max" | bc -l) )); then
      new=$max
    fi
    ;;
  down)
    new=$(echo "$current - $step" | bc)
    min=0.0
    if (( $(echo "$new < $min" | bc -l) )); then
      new=$min
    fi
    ;;
  mute)
    wpctl set-mute "$sink" toggle
    pkill -RTMIN+10 dwmblocks
    exit 0
    ;;
  *)
    echo "Usage: $0 {up|down|mute}"
    exit 1
    ;;
esac

wpctl set-volume "$sink" "$new"
pkill -RTMIN+10 dwmblocks
