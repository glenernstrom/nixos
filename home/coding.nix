{ pkgs, ... }:

{ 
  programs.neovim.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    ghostty
    jupyterlab
    python3
    ipython
  ];
}
