{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
    pdfarranger
    texliveFull
    rnote
    libreoffice
    hunspell
    hunspellDicts.en_US
    super-productivity
    apostrophe
    joplin-desktop
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
