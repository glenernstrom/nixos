{ pkgs,  ... }:

{
  services.flatpak.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
  ];

}
