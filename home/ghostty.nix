{ pkgs, ... }:

xdg.configFile."ghostty/config" = {
  text = ''
    theme = catppuccin-mocha
    font-family = JetBrains Mono
    font-size = 14
  '';
  force = true;
};

