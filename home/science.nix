{ config, pkgs, ... }:

  {
    home.packages = with pkgs;
    [
      pymol
      nucleus
      coulomb
      texliveFull
      pandoc
    ]; 
  }
