{ pkgs, ... }:

{

  # Display server + GNOME
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "otterbrain";
  services.desktopManager.gnome.enable = true;

  # GNOME needs deconf
  programs.dconf.enable = true;

  # Provide GNOME Qt integration
   qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # GNOME keyring (needed for Git, browsers, Wi-Fi, etc.)
 # services.gnome.gnome-keyring.enable = true;

  # Portals (Wayland + Flatpak compatibility, even if you don’t use Flatpak)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
  ];


 }

