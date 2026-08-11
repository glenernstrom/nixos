{ pkgs, ... }:

{

  # Display server + GNOME

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = true;
  environment.gnome.excludePackages = with pkgs; [ ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
