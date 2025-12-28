{ pkgs, ... }:

{
  system.stateVersion = "25.11";

  documentation.enable = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
  ];

  services.dbus.enable = true;
}

