{ pkgs, ...}:

{ 
  home.packages = with pkgs; [
    inkscape
    gimp
    pdfarranger
    ffmpeg
  ];
}
