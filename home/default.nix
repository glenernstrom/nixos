{config, pkgs, ... }:

{
  home-manager.backupFileExtension = "bak";

  home-manager.users.otterbrain = {
      imports = [
        ./creative.nix
        ./communication.nix
        ./productivity.nix
        ./git.nix
        ./nvim/neovim.nix
        ./distrobox-apps.nix
	      ./utilities.nix
	      ./ghostty/ghostty.nix
        ./latex-wrappers.nix
        ];

        home.stateVersion = "25.11";
  };
}
