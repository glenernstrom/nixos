{ pkgs, ... }:  
  
{  
  home.packages = with pkgs; [
    pymol
    nucleus
    positron-bin
    rWrapper
  ];
}
