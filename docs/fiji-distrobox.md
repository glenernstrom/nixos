# Fiji (ImageJ) via Distrobox on NixOS

This document describes a **robust, reproducible pattern** for running **Fiji (ImageJ)** inside a **Distrobox container** on **NixOS**, with:

- NVIDIA GPU acceleration
- GNOME desktop integration
- User-writable plugin updates
- Wayland + Xwayland compatibility

This approach keeps the host system clean and immutable while allowing Fiji to behave as intended.

---

## Why Distrobox for Fiji?

Fiji is:
- a self-updating scientific tool
- Java-based (AWT/Swing, still X11-oriented)
- sensitive to filesystem permissions
- prone to dependency conflicts on immutable systems

Running Fiji in a Distrobox container provides:
- isolation from the host
- predictable behavior across machines
- proper plugin updates
- native-feeling desktop integration

---

## Prerequisites (Host)

On NixOS, ensure the following are enabled system-wide:

```nix
virtualisation.podman.enable = true;

environment.systemPackages = with pkgs; [
  podman
  distrobox
  xorg.xhost
];

