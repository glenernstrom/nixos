{ pkgs, ... }:

{ 
  programs.neovim.enable = true;
  programs.fish.enable = true;

  home.packages = with pkgs; [
    ghostty
  ];


  home.packages = with pkgs; [
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

