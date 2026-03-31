{ pkgs, ... }:

{
  system.stateVersion = "25.11";

  documentation.enable = true;

  nix.settings.download-buffer-size = 524288000;
  
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    distrobox
  ];
  environment.localBinInPath = true;
  services.dbus.enable = true;
}

