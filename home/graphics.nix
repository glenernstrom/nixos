{ pkgs, ...}:

{ 
  home.packages = with pkgs; [
    inkscape
    gimp
    scribus
    darktable
  ];
}
