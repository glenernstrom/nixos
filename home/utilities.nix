{ pkgs, ... }:

{


  programs.pay-respects = {
    enable = true;
  };


  home.packages = with pkgs; [
    bitwarden-desktop
    desktop-file-utils
<<<<<<< HEAD
    yt-dlp
=======
    tesseract4
>>>>>>> b229328add938ab23d37f0770ae2d78feb6dd43b
  ];
}
