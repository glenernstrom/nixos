{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    mumble
    fractal
  ];
}
