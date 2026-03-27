{pkgs, ... }:

{
  home.packages = with pkgs; [
    texliveFull
    ];

    programs.bash.enable = true;

    programs.fish.enable = true;
}
