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
  ];

  services.dbus.enable = true;
}

