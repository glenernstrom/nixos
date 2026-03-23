{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
<<<<<<< HEAD
    pdfarranger
    texliveFull
    rnote
    libreoffice
    hunspell
    hunspellDicts.en_US
    super-productivity
=======
<<<<<<< HEAD
    pandoc
=======
>>>>>>> 40c90b075039e4a8e4e654caafc717ea2d3116ac
>>>>>>> 48fcf14df0180ad4bf54c4c937e608b41fb4d307
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
