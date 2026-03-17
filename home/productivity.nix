{pkgs, ... }:

{
  home.packages = with pkgs; [
    texmaker
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
