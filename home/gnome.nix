{ pkgs, ... }:

{
  # Display server + GNOME
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # GNOME needs dconf
  programs.dconf.enable = true;

  # GNOME keyring (needed for Git, browsers, Wi-Fi, etc.)
  services.gnome.gnome-keyring.enable = true;

  # Portals (Wayland + Flatpak compatibility, even if you don’t use Flatpak)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
  ];

  # Light GNOME utilities (system-level)
  home.packages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];
}

