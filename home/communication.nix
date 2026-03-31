{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
   fractal
   zoom-us
   mumble
   firefox
   microsoft-edge
  ];
}
