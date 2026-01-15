{pkgs, ... }:

{
  home.packages = with pkgs; [
    texliveFull
    texmaker
    libreoffice
    citations
    joplin-desktop
    pandoc
    hunspell
    hunspellDicts.en_US
    ];
}
