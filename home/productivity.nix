{pkgs, ... }:

{
  home.packages = with pkgs; [
<<<<<<< HEAD
    texmaker
    pdfarranger
    texliveFull
    rnote
    libreoffice
    hunspell
    hunspellDicts.en_US
    super-productivity
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
