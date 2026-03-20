{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
<<<<<<< HEAD
    pandoc
=======
>>>>>>> 40c90b075039e4a8e4e654caafc717ea2d3116ac
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
