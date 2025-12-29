{ pkgs, ... }:

{
  programs.pay-respects = {
    enable = true;
  };

  home.packages = with pkgs; [
    zoxide
    tldr
    eza
    bat
    neofetch
  ];
}

