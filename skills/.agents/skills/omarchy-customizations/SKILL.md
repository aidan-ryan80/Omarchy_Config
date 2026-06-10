---
name: omarchy-customizations
description: >
  Documents all user customizations to the Omarchy system, stored in
  ~/Dotfiles. Covers shell, Hyprland, network, backup, and security
  configurations. Use when asked about system setup, configs, or tools.
---

# Omarchy Customizations

This skill documents all user-level customizations on this Omarchy system.
Source of truth is `~/Dotfiles` (git repo at `aidan-ryan80/Omarchy_Config`).

## Dotfiles Philosophy

Only customized/edited files go into `~/Dotfiles`. Default/unchanged files stay in their original `~/.config/*` locations untouched. `stow` is used only to deploy the customized files — it never replaces or manages default configs.

## Shell (`~/Dotfiles/bash/`)

| File | Purpose |
|------|---------|
| `.bashrc` | Main interactive config — sources Omarchy defaults, then overlays portable config |
| `.bashrc.portable` | Full portable bashrc for non-Omarchy machines |
| `.inputrc` | `Ctrl+H` → backward-kill-word |

**Key shell setup:**
- `py` alias for python
- `.bashrc` conditionally sources Omarchy's default rc, else falls back to portable
- Portable has: `zoxide` (`cd`→`z`), `eza` (`ls`→`eza`), rich git/tool aliases, `mkcd`/`extract` helpers

## Window Manager (`~/Dotfiles/hypr/.config/hypr/`)

### Monitors (`monitors.conf`)
- **3 displays**: HP E240c (left) | Acer B246HL (center) | Laptop 2560×1600@240 (right)
- Laptop at scale 1.60, externals at scale 1.0
- **Persistent workspaces**: 1,4,7 on laptop | 2,5,8 on Acer | 3,6,9 on HP
- Laptop model-agnostic config (works for Acer PHN16-73 and Legion 7i)

### Keybindings (`bindings.conf`)
Heavily customized. All `Super+Shift+<key>` launches:

| Binding | App |
|---------|-----|
| `Super+Return` | Terminal |
| `Super+Alt+Return` | Tmux terminal |
| `Super+Shift+Return/B` | Browser |
| `Super+Shift+Alt+B` | Private browser |
| `Super+Shift+M` | Spotify |
| `Super+Shift+N` | opencode (editor/agent) |
| `Super+Shift+D` | lazydocker |
| `Super+Shift+O` | Obsidian |
| `Super+Shift+W` | Typora |
| `Super+Shift+/` | 1Password |
| `Super+Shift+A` | ChatGPT (webapp) |
| `Super+Shift+Alt+A` | Grok (webapp) |
| `Super+Shift+Y` | YouTube (webapp) |
| `Super+Shift+Ctrl+G` | Google Messages (webapp) |
| `Super+Shift+P` | Google Photos (webapp) |
| `Super+Shift+X` | X/Twitter (webapp) |
| `Super+Shift+C` | Google Calendar (webapp) |
| `Super+Shift+E` | Gmail (webapp) |
| `Super+Shift+T` | Teams (webapp) |
| `Super+Shift+Alt+D` | Discord (webapp) |
| `Super+Alt+Shift+F` | Nautilus file manager |
| `Super+Shift+G` | WhatsApp (webapp) |
| `Super+Shift+Alt+G` | Signal (webapp) |
| `Super+F` | Full-width (fullscreen 1) |
| `Super+Shift+F` | Full-screen (fullscreen 0) |

### Environment (`envs.conf`)
NVIDIA Wayland optimizations:
- `NVD_BACKEND=direct`
- `LIBVA_DRIVER_NAME=nvidia`
- `__GLX_VENDOR_LIBRARY_NAME=nvidia`

### Idle (`hypridle.conf`)
- 2.5m: screensaver
- 5m: lock (via `loginctl lock-session`)
- 5.5m: keyboard backlight off + DPMS display off

### Blue Light (`hyprsunset.conf`)
- Identity profile (no tint), starts at 07:00

### Input (`input.conf`)
- US layout, Caps Lock as compose
- Repeat rate 40, delay 250ms
- Numlock on by default
- Touchpad: clickfinger behavior, scroll factor 0.4

## Terminal (`~/Dotfiles/ghostty/.config/ghostty/config`)

- **Font**: CaskaydiaMono Nerd Font, size 9
- **Theme**: Dynamic from Omarchy theme overrides
- **Padding**: 14px
- **Cursor**: Block, no blink
- **Keybindings**: `F11` fullscreen, `Shift+Insert`/`Ctrl+Insert` clipboard, `Ctrl+Shift+H/PageUp/PageDown` split/tab nav, numpad scroll workaround, `Ctrl+Shift+R` prompt tab title
- **Performance**: `async-backend = epoll` (Hyprland fix)

## Status Bar (`~/Dotfiles/waybar/.config/waybar/`)

- **Height**: 26px, top bar
- **Left**: Omarchy menu icon, workspace numbers
- **Center**: Clock, update indicator, voxtype, screen recording, idle, notification silencing
- **Right**: Tray expander, bluetooth, network, pulseaudio, CPU, battery
- **Style**: CaskaydiaMono Nerd Font 12px, no borders, no border radius, dark red (#a55555) for active states
- **Modules**: `custom/omarchy`, `custom/update`, `custom/screenrecording-indicator`, `custom/voxtype`, `custom/idle-indicator`, `custom/notification-silencing-indicator`

## Backup Strategy (`~/Dotfiles/scripts/`)

| Script | Purpose |
|--------|---------|
| `backup-machine` | Full backup — rsync mirror + Borg versioned to USB labeled BACKUPS |
| `toggle-bat-mode` | Legion battery conservation mode (`full`/`safe`) |
| `waybar-bat-status` | Waybar module for battery conservation mode |
| `create-pkg-markdown` | Generates package list markdown from `pacman` |

**Backup schedule**: rsync (live mirror) + Borg (compressed zstd,3, prune: 7d/4w/6m/2y)

**Exclusions** (`borg/` and `rsync/`): `.cache`, `Archive/`, `Trash/`, flatpak, Steam, browser caches, `.copilot/`, `.ollama/`, `.npm/`, `.minecraft/`

## Tools & Editors

| Tool | Config Location | Notes |
|------|-----------------|-------|
| **opencode** | `~/Dotfiles/opencode/.config/opencode/` | Autoupdate off, permission: ask, custom `<leader>p` for paste summary |
| **Neovim** | `~/Dotfiles/nvim/.config/nvim/` | LazyVim with neo-tree + markdown extras. `lazyvim.json` and `lua/plugins/markdownlint.lua` symlinked from Dotfiles |
| **markdownlint** | `~/Dotfiles/markdownlint/.config/markdownlint/.markdownlint.jsonc` | Disables MD013, MD032, MD041, MD060. nvim-lint passes `--config` explicitly to cli2 via `~/.config/nvim/lua/plugins/markdownlint.lua` (symlinked from Dotfiles) |

## Security & Secrets

- `.gitignore` excludes: `.git-credentials`, `.ssh/`, `*history`
- Borg passphrase stored in `backup-machine` script (plaintext — known weak point)
- No GPG-encrypted secrets in the repo

## Skill Management

Skills are managed through Dotfiles using stow:

- **Source:** `~/Dotfiles/skills/.agents/skills/<skill-name>/SKILL.md`
- **Symlink:** `~/.agents/skills/<skill-name>/` → `~/Dotfiles/skills/.agents/skills/<skill-name>/` (via `stow skills`)
- **Deploy on new machine:** `cd ~/Dotfiles && stow skills`

All new skills should follow this pattern — create the stow-compatible structure in `~/Dotfiles/skills/`, then run `stow skills` to symlink them.

## Key Filesystem Paths

| Path | Purpose |
|------|---------|
| `~/Dotfiles/` | Git repo root (aidan-ryan80/Omarchy_Config) |
| `~/.config/hypr/` | Hyprland WM config (symlinked/stowed from Dotfiles) |
| `~/.config/waybar/` | Status bar config |
| `~/.config/ghostty/config` | Terminal config |
| `~/.config/opencode/` | AI coding agent config |
| `~/.config/markdownlint/` | markdownlint-cli2 rules config (symlinked from Dotfiles) |
| `~/.local/bin/backup-machine` | Backup script on PATH |
| `~/.local/bin/toggle-bat-mode` | Battery conservation toggle |

## What NOT to touch

- `~/.local/share/omarchy/` — Omarchy source (read-only, managed by `omarchy update`)
- `/boot/limine.conf` — Bootloader (dual-boot config, has Windows chainload that broke BCD)
- Any `secrets`, `credentials`, or `.env` files — not in Dotfiles, not documented here
