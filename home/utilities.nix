{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    bitwarden-desktop
    impression
    desktop-file-utils
  ];
}
