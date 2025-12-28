{ pkgs, ... }:

{ 
  programs.neovim.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    ghostty


  # Python 3.13 + Jupyter environment
    (python313.withPackages (ps: with ps; [
      jupyterlab
      ipython
      numpy
      scipy
      pandas
      matplotlib
    ]))
   ];
 }

