{ pkgs, ...}:

{ 
  home.packages = with pkgs; [
    inkscape
    gimp
    darktable
    pdfarranger
  ];
}
