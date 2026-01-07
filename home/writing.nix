{pkgs, ... }:

{
  home.packages = with pkgs; [
    texliveFull
    texmaker
    libreoffice
    citations
    joplin-desktop
    apostrophe
    ];
}
