{ pkgs, ... }:

{
  system.stateVersion = "25.11";

  documentation.enable = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    xorg.xhost
    pciutils
    nodejs_25
  ];

  services.dbus.enable = true;
}

