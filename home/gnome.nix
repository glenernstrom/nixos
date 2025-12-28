{pkgs, ... }:

{

  # Light GNOME utilities (system-level)
  home.packages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];
}

