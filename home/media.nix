{ pkgs, ... }:
  
{ 
  home.packages = with pkgs; [
    obs-studio
    kdenlive
    kooha
    audacity
    vlc
    ffmpeg
  ];
}
