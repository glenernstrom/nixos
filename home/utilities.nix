{ pkgs, ... }:

{


  programs.pay-respects = {
    enable = true;
  };


  home.packages = with pkgs; [
    tesseract4
    warp
    bitwarden-desktop
   ];
}
