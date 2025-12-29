{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config" = {
    text = ''
      theme = catppuccin-mocha
      font-family = JetBrains Mono
      font-size = 12
    '';
    force = true;
  };
}

