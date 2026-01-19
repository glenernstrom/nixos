#!/usr/bin/env bash
set -euo pipefail

has_nvidia() {
  command -v nvidia-smi >/dev/null 2>&1 || return 1
  nvidia-smi -L >/dev/null 2>&1 || return 1
}

create_if_missing () {
  local name="$1"
  local image="$2"
  local home="$3"

  if ! distrobox-list --no-color 2>/dev/null | awk '{print $1}' | grep -qx "$name"; then
    distrobox create --name "$name" --image "$image" --home "$home" --yes
  fi
}

run_bootstrap () {
  local name="$1"
  local script="$2"
  distrobox enter "$name" -- bash -lc "$(cat "$script")"
}

export_app () {
  local name="$1"
  local app="$2"
  distrobox-export --box "$name" --app "$app" || true
}

create_if_missing ubuntu-fiji ubuntu:24.04 "$HOME/.local/share/distrobox/ubuntu-fiji"
create_if_missing ubuntu-rstudio ubuntu:24.04 "$HOME/.local/share/distrobox/ubuntu-rstudio"

run_bootstrap ubuntu-fiji   "$HOME/.config/distrobox-bootstrap/ubuntu-fiji-bootstrap.sh"
run_bootstrap ubuntu-rstudio "$HOME/.config/distrobox-bootstrap/ubuntu-rstudio-bootstrap.sh"

export_app ubuntu-fiji fiji
export_app ubuntu-rstudio rstudio

# Helps GNOME pick up new .desktop files quickly
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$HOME/.local/share/applications" || true
fi

