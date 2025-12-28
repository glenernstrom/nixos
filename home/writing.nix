{pkgs, ... }:

{
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    texmaker
    libreoffice
    gnome.citations
    joplin-desktop
    jabref
    ];
}
