{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
    pandoc
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
