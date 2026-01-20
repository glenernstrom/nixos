# Fiji (ImageJ) on NixOS via Distrobox --- v2

This document describes a **known‑good, reproducible way** to run Fiji
(ImageJ) on NixOS using **Distrobox + Podman** with full GNOME
integration.

It incorporates lessons learned from earlier attempts and fixes a
critical pitfall involving `distrobox-export` wrappers and GNOME/NixOS
environment leakage.

------------------------------------------------------------------------

## Why Fiji is not installed via Nixpkgs

Fiji is intentionally **not** installed from `nixpkgs` because:

-   The upstream Fiji distribution bundles a JVM and native libraries
    that do not behave well in the Nix store
-   Fiji's built‑in updater cannot update software installed into
    immutable paths
-   Java + GTK/GIO integration is far more reliable in a standard Ubuntu
    userspace
-   GNOME launcher integration is simpler and more predictable via
    Distrobox

Instead, Fiji runs inside an **Ubuntu 24.04 (noble) Distrobox
container**, integrated into the desktop as if it were native.

------------------------------------------------------------------------

## Architecture overview

-   **Host OS:** NixOS (GNOME, Wayland/XWayland)
-   **Container runtime:** Podman (rootless)
-   **Container manager:** Distrobox
-   **Guest OS:** Ubuntu 24.04 (noble)
-   **Fiji source:** Official upstream zip (bundled JDK)

------------------------------------------------------------------------

## Important warning (read this first)

> **Do NOT launch Fiji via the `fiji` command created by
> `distrobox-export`.**

`distrobox-export` generates wrapper scripts that: - hardcode host paths
such as `/run/current-system/sw/bin/distrobox-enter` - may reference the
wrong container name - can re‑inject NixOS `/nix/store` paths into the
container runtime

This causes **GLib/GVFS ABI mismatches** and crashes like:

    undefined symbol: g_variant_builder_init_static

For Fiji, **manual launch wrappers are more reliable than exports**.

------------------------------------------------------------------------

## Container setup (Ubuntu 24.04)

Inside the `ubuntu-fiji` container:

### Required runtime libraries

``` bash
sudo apt update
sudo apt install -y   libx11-6 libx11-xcb1 libxext6 libxrender1 libxtst6 libxi6   libxrandr2 libxinerama1 libxcursor1 libxdamage1 libxfixes3   libglib2.0-0t64 wget unzip ca-certificates
```

------------------------------------------------------------------------

## Fiji installation location

Fiji is installed **per-user** inside the container at:

    ~/Applications/Fiji/

The real launcher is:

    ~/Applications/Fiji/fiji

(Do not confuse this with exported wrapper scripts named `fiji`.)

------------------------------------------------------------------------

## The root cause of crashes on NixOS

GNOME on NixOS exports a very large `XDG_DATA_DIRS` containing
`/nix/store` paths.

When inherited by a container, this causes Fiji (via Java + GIO) to load
**host gvfs/GIO modules**, leading to ABI mismatches and crashes.

The fix is to: - scrub contaminated variables **inside the container** -
force Ubuntu-native GIO behavior - avoid gvfs entirely

------------------------------------------------------------------------

## Known‑good launch command (inside container)

This is the canonical, working launch pattern:

``` bash
distrobox enter ubuntu-fiji -- bash -lc '
unset XDG_DATA_DIRS XDG_CONFIG_DIRS XDG_CURRENT_DESKTOP
unset GIO_MODULE_DIR GIO_EXTRA_MODULES GIO_MODULE_PATH
unset GTK_PATH GTK_MODULES GI_TYPELIB_PATH GSETTINGS_SCHEMA_DIR
unset LD_LIBRARY_PATH

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export GIO_USE_VFS=local
export GDK_BACKEND=x11

exec /home/otterbrain/Applications/Fiji/fiji
'
```

If this launches Fiji cleanly **without `/nix/store` gvfs errors**, your
environment is correct.

------------------------------------------------------------------------

## GNOME integration (recommended approach)

### Host wrapper

Create a deterministic launcher on the host:

``` bash
~/.local/bin/fiji-distrobox
```

``` bash
#!/usr/bin/env bash
set -euo pipefail

exec distrobox enter ubuntu-fiji -- bash -lc '
unset XDG_DATA_DIRS XDG_CONFIG_DIRS XDG_CURRENT_DESKTOP
unset GIO_MODULE_DIR GIO_EXTRA_MODULES GIO_MODULE_PATH
unset GTK_PATH GTK_MODULES GI_TYPELIB_PATH GSETTINGS_SCHEMA_DIR
unset LD_LIBRARY_PATH

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export GIO_USE_VFS=local
export GDK_BACKEND=x11

exec /home/otterbrain/Applications/Fiji/fiji
'
```

Make it executable:

``` bash
chmod +x ~/.local/bin/fiji-distrobox
```

------------------------------------------------------------------------

### GNOME desktop entry

``` ini
[Desktop Entry]
Type=Application
Name=Fiji (Distrobox)
Exec=/home/otterbrain/.local/bin/fiji-distrobox
Terminal=false
Categories=Science;Education;
Icon=applications-science
```

Save as:

    ~/.local/share/applications/fiji-distrobox.desktop

Then run:

``` bash
update-desktop-database ~/.local/share/applications || true
```

Fiji will now appear in the GNOME app grid and launch reliably.

------------------------------------------------------------------------

## Updating Fiji

Fiji updates itself normally via **Help → Update** inside the
application.

No container rebuild is required.

------------------------------------------------------------------------

## Reproducibility notes

-   This setup prioritizes **usability and upstream compatibility**
-   For strict reproducibility, pin Fiji versions manually
-   The host wrapper + desktop entry can be generated via Home Manager
    for multi‑machine consistency

------------------------------------------------------------------------

## Summary

-   Fiji runs best on NixOS via Ubuntu + Distrobox
-   Avoid `distrobox-export` for Fiji
-   Always launch the real binary inside the container
-   Scrub GNOME/NixOS environment variables **inside** the container
-   Use a custom GNOME launcher for reliability

This pattern has proven stable across GNOME Wayland, XWayland, and
multiple NixOS systems.
