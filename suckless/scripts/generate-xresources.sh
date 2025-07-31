#!/bin/bash

base00="#101010"
base01="#202020"
base02="#2b2b2b"
base03="#505050"
base04="#b0b0b0"
base05="#d0d0d0"
base06="#e0e0e0"
base07="#fafafa"
base08="#ab4642"
base09="#dc9656"
base0A="#f7ca88"
base0B="#a1b56c"
base0C="#86c1b9"
base0D="#6076cf"
base0E="#ba8baf"
base0F="#a16946"

accent=$base0A
bg_normal=$base00
fg_normal=$base07
bg_secondary=$base02
bg_sel=$base01
fg_sel=$base07

output="$HOME/.Xresources.d/dwm.Xresources"

mkdir -p "$(dirname "$output")"

cat > "$output" <<EOF
dwm.normfgcolor:            $fg_normal
dwm.normbgcolor:            $bg_normal
dwm.normbordercolor:        $bg_secondary
dwm.normfloatcolor:         $base00
dwm.selfgcolor:             $base00
dwm.selbgcolor:             $accent
dwm.selbordercolor:         $bg_sel
dwm.selfloatcolor:          $accent
dwm.titlenormfgcolor:       $base05
dwm.titlenormbgcolor:       $base00
dwm.titlenormbordercolor:   $base01
dwm.titlenormfloatcolor:    $base00
dwm.titleselfgcolor:        $base07
dwm.titleselbgcolor:        $base01
dwm.titleselbordercolor:    $accent
dwm.titleselfloatcolor:     $accent
dwm.tagsnormfgcolor:        $base05
dwm.tagsnormbgcolor:        $base00
dwm.tagsnormbordercolor:    $base01
dwm.tagsnormfloatcolor:     $base00
dwm.tagsselfgcolor:         $fg_sel
dwm.tagsselbgcolor:         $bg_sel
dwm.tagsselbordercolor:     $accent
dwm.tagsselfloatcolor:      $accent
dwm.hidnormfgcolor:         $base04
dwm.hidnormbgcolor:         $base00
dwm.hidselfgcolor:          $base01
dwm.hidselbgcolor:          $base01
dwm.urgfgcolor:             $base07
dwm.urgbgcolor:             $base08
dwm.urgbordercolor:         $base08
dwm.urgfloatcolor:          $base08
EOF

xrdb -merge "$output"
xsetroot -solid "$bg_normal"
