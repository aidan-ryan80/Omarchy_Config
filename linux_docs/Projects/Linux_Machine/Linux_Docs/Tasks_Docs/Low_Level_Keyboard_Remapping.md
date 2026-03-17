### Goal:
##### Remap keys above F keys to work on external keyboards as well and troubleshoot + fix capslock key

### Options:

1. Use setxkbmap (X11) or swaykbdd/hyprctl (Wayland) to remap keys
2. System wide XKB remap using localectl
3. Low-level remapping using keyd, which is a kernel level remapper

### Research:
- Search in ChatGPT for the **Remap Caps Lock to Esc** chat where a test with the caps lock was done with the command:
```bash
sudo libinput debug-events | grep -i key
```
- The Caps Lock might be a "compose/dead key chain reaction" according to GPT
- (Do more research with following the process from kernel input event to Wayland/Hyprland handling the input event)