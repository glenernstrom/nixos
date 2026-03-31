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
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
