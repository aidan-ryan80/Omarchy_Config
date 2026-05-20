# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# For debugging duplicate PATH to /home/aidan/.local/bin/
# echo "PATH before Omarchy: $PATH"

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
alias py='python'

# Function for opening markdown files in obsidian from the terminal.
# TODO: Look into fixing these functions. Commented out for now

# export OBSIDIAN_VAULT="$HOME/Obsidian"
#
# ob() {
#   local file="${1:-.}"
#   local rel
#   rel=$(realpath --canonicalize-missing --relative-to="$OBSIDIAN_VAULT" "$file" 2>/dev/null) || rel="$file"
#
#   command obsidian open path="$rel" vault="Obsidian" newtab >/dev/null 2>&1 & disown
# }
#
# ob_new_window() {
#   local file="${1:-}"
#   local rel
#   rel=$(realpath --canonicalize-missing --relative-to="$OBSIDIAN_VAULT" "$file" 2>/dev/null) || rel="$file"
#
#   command obsidian command id="workspace:new-window" >/dev/null 2>&1
#   sleep 0.12
#   command obsidian open path="$rel" vault="Obsidian" >/dev/null 2>&1 & disown
# }
