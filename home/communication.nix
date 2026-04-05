{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
   fractal
   zoom-us
   firefox
   microsoft-edge
  ];
}
