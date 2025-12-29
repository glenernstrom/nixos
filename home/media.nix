{ pkgs, ... }:
  
{ 
  home.packages = with pkgs; [
    obs-studio
    kdePackages.kdenlive
    kooha
    audacity
    vlc
    ffmpeg
    gnome-podcasts
    cozy
  ];
}
