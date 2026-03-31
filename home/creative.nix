{ pkgs, ...}:

{ 
  home.packages = with pkgs; [
    ffmpeg
    gimp
    inkscape
    obs-studio
    kooha
    audacity
    shotcut
  ];
}
