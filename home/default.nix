{ config, pkgs, ... }:

{
  home-manager.backupFileExtension = "bak";

  home-manager.users.glen = {
  imports = [
    ./graphics.nix
    ./internet.nix
    ./media.nix
    ./utilities.nix
    ./nvim/neovim.nix
    ./ghostty/ghostty.nix
    ./games.nix
    ./science.nix
    ./office.nix
    ./focus.nix
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  
  programs.bash = {
    enable = true;
    initExtra = ''
    if [ -n "$IN_NIX_SHELL" ] || [ -n "$NIX_BUILD_TOP" ]; then
      export PS1="(nix) $PS1"
    fi
  '';
   };

  };
}
