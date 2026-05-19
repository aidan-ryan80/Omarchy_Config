#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <copy|paste|cut>" >&2
  exit 1
fi

action="$1"
class="$(hyprctl activewindow | awk -F': ' '/^class:/{print $2; exit}')"
escaped_class="$(printf '%s' "$class" | sed -e 's/[.[\*^$(){}+?|\\/]/\\&/g')"
target="class:^${escaped_class}$"

case "$class" in
  brave-browser|chromium|firefox|firefox-esr|google-chrome|librewolf|microsoft-edge|opera|vivaldi-stable|zen-browser)
    case "$action" in
      copy)  hyprctl dispatch sendshortcut CTRL,C,"$target" ;;
      paste) hyprctl dispatch sendshortcut CTRL,V,"$target" ;;
      cut)   hyprctl dispatch sendshortcut CTRL,X,"$target" ;;
      *) echo "Unknown action: $action" >&2; exit 1 ;;
    esac
    ;;
  *)
    case "$action" in
      copy)  hyprctl dispatch sendshortcut CTRL,Insert,"$target" ;;
      paste) hyprctl dispatch sendshortcut SHIFT,Insert,"$target" ;;
      cut)   hyprctl dispatch sendshortcut CTRL,X,"$target" ;;
      *) echo "Unknown action: $action" >&2; exit 1 ;;
    esac
    ;;
esac
