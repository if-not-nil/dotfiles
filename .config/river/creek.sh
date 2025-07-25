#!/usr/bin/env bash
killall creek
( while date; do sleep 1; done ) | ~/bin/creek \
  -fn "Terminess Nerd Font Mono:size=16" \
  -hg 22 \
  -nf "0x$(~/.base16 7)" \
  -nb "0x$(~/.base16 0)" \
  -ff "0x$(~/.base16 7)" \
  -fb "0x$(~/.base16 2)"  
