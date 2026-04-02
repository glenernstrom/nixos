{pkgs, ... }:

{
  home.packages = with pkgs; [
    pymol
    nucleus
    gnome-graphs
    ];
}
