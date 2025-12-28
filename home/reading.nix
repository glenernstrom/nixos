{ pkgs, ... }:

{
  home.packages = with pkgs; [
    calibre
    foliate
    cozy
  ];
}
