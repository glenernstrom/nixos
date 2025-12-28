{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    bitwarden
    impression
  ];
}
