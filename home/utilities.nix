  {config, pkgs, ... }:

  {

    home.packages = with pkgs; [
      impression 
      tesseract5
      pay-respects
      tree
      deja-dup
      bitwarden-desktop
      gnome-extension-manager
      gnome-tweaks
      smile
      distroshelf
    ];
  }
