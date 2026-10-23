#!/usr/bin/bash
set -euo pipefail

config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
marker="$config_home/.beyondos-defaults-applied"
autostart_file="$config_home/autostart/beyondos-first-login.desktop"

mkdir -p "$config_home"

if [[ -e "$marker" ]]; then
    rm -f "$autostart_file"
    exit 0
fi

if command -v plasma-apply-colorscheme >/dev/null 2>&1; then
    plasma-apply-colorscheme BeyondOS || true
fi

if command -v plasma-apply-wallpaperimage >/dev/null 2>&1; then
    plasma-apply-wallpaperimage /usr/share/backgrounds/beyondos/beyondos-wallpaper.png || true
fi

touch "$marker"
rm -f "$autostart_file"
