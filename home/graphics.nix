{ config, pkgs, ... }:

  {
    home.packages = with pkgs; [
      inkscape
      gimp
      scribus
      krita
      xournalpp
      eyedropper
      constrict
      curtail
      rnote
      switcheroo
     ]; 

  }
