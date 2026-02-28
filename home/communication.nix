{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    mumble
    element-desktop
    fractal
    slack
    discord
    zoom-us
  ];
}
