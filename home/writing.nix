{pkgs, ... }:

{
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    texmaker
    libreoffice
    citations
    joplin-desktop
    apostrophe
    ];
}
