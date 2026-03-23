{ pkgs, ...}:

{ 
  home.packages = with pkgs; [
    ffmpeg
    shotcut
    obs-studio
    inkscape
    gimp
  ];
}
