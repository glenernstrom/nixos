{ pkgs, ... }:  
  
{  
  home.packages = with pkgs; [
    pymol
    nucleus
    positron
    python3
    rWrapper
  ];
}
