#!/usr/bin/env bash
set -euo pipefail

out="/tmp/hypr-activewindow-debug.txt"
hyprctl activewindow >"$out"
info="$(awk -F': ' '
  /^class:/{class=$2}
  /^title:/{title=$2}
  END{print class " | " title}
' "$out")"

notify-send "Active window" "$info"
