{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config" = {
    text = ''
      theme = catppuccin-mocha
      font-family = JetBrainsMono Nerd Font
      font-size = 12
    '';
    force = true;
  };

  xdg.configFile."ghostty/themes".source = ./themes;

}

