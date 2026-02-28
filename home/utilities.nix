{ pkgs, ... }:

{


  programs.pay-respects = {
    enable = true;
  };


  home.packages = with pkgs; [
    bitwarden-desktop
    desktop-file-utils
    tesseract4
  ];
}
