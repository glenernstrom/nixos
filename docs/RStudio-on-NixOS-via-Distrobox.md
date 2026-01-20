# RStudio on NixOS (via Distrobox)

## Why RStudio is not installed via Nixpkgs

RStudio Desktop and R are intentionally **not** installed from `nixpkgs`
because:

-   RStudio's upstream Linux builds are Electron-based and frequently
    break or lag behind in Nixpkgs
-   RStudio's built-in updater does not work correctly in immutable Nix
    store paths
-   CRAN R updates more quickly and predictably via Ubuntu's official
    CRAN apt repository
-   GUI integration (GNOME launchers, fonts, themes) is more reliable in
    a standard Ubuntu userspace

Instead, RStudio is run inside a **Distrobox container based on Ubuntu
24.04**, which provides: - upstream compatibility - working upgrades via
bootstrap refresh - clean separation from the NixOS host

------------------------------------------------------------------------

## Architecture overview

-   **Host OS:** NixOS (GNOME)
-   **Container runtime:** Podman (rootless)
-   **Container manager:** Distrobox
-   **Guest OS:** Ubuntu 24.04 (noble)
-   **R source:** CRAN apt repository
-   **RStudio source:** Official Posit `.deb`

The container is integrated into the desktop using `distrobox-export`,
so RStudio appears and launches like a native GNOME application.

------------------------------------------------------------------------

## Where the configuration lives

-   Bootstrap script:\
    `nixos/distrobox/containers/ubuntu-rstudio/bootstrap.sh`

-   Orchestration script:\
    `nixos/distrobox/manage.sh`

-   Home Manager wiring:\
    `nixos/home/distrobox-apps.nix`

The bootstrap scripts are deployed to:

    ~/.config/distrobox-bootstrap/

via Home Manager. These deployed files are generated artifacts ---
**edit the repository versions, not the deployed copies**.

------------------------------------------------------------------------

## Updating R

R is installed from CRAN's Ubuntu repository. To update:

``` bash
distrobox enter ubuntu-rstudio
sudo apt update && sudo apt upgrade -y
```

Installed R packages live in a **persistent user library**:

    ~/R/library

and do not require sudo.

------------------------------------------------------------------------

## Updating RStudio

RStudio is installed via a pinned `.deb` in the bootstrap script.

To update: 1. Edit the RStudio download URL in\
`nixos/distrobox/containers/ubuntu-rstudio/bootstrap.sh` 2. Rebuild and
rerun:
`bash    sudo nixos-rebuild switch --flake .#<hostname>    distrobox-manage-apps`

This upgrades RStudio in-place while preserving settings and projects.

------------------------------------------------------------------------

## Re-running setup / fixing a broken install

To (re)provision RStudio on any machine:

``` bash
distrobox-manage-apps
```

This command is idempotent and safe to run multiple times.

------------------------------------------------------------------------

## Notes on reproducibility

-   This setup prioritizes **workflow stability and usability** over
    strict reproducibility.
-   For projects that require exact dependency pinning, use `renv`
    inside RStudio.
-   For interactive analysis and teaching, a shared user library is
    preferred.
