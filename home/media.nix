{pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-podcasts
    cozy
    foliate
    ];
}
