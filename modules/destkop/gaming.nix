{ pkgs, ... }:

{
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;

  hardware.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    gamemode
    lutris
    heroic
    wineWowPackages.stable
    protontricks
  ];
}
