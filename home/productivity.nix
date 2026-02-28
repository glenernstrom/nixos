{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
    pandoc
    libreoffice
    hunspell
    hunspellDicts.en_US
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
