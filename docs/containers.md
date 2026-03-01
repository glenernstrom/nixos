# Containerized Applications (Distrobox)

We containerize fast-moving or dependency-heavy scientific applications
to avoid polluting the NixOS host environment.

Host: NixOS (flake-based)
Container runtime: podman
Container tool: distrobox

---

## Why Containers?

- Avoid nixos-unstable breakage for large apps
- Avoid mixing system libs (GTK/GVFS conflicts)
- Keep scientific tools isolated
- Maintain reproducible bootstrap scripts

---

# Containers Overview

| Container        | Purpose     | Image         |
|------------------|------------|--------------|
| ubuntu-fiji     | Fiji/ImageJ | ubuntu:24.04 |
| ubuntu-rstudio  | R + RStudio | ubuntu:24.04 |
| latex           | TeX stack   | ubuntu:24.04 |

---

# Rebuilding Containers

All container creation is managed from:

nixos/distrobox/manage.sh

Each container has a bootstrap script in:

nixos/distrobox/containers/<name>/bootstrap.sh

To recreate everything:

```bash
cd ~/nixos/distrobox
bash manage.sh
