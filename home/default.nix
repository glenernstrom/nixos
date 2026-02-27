{config, pkgs, ... }:

{
  home-manager.backupFileExtension = "bak";

  home-manager.users.otterbrain = {
      imports = [
        ./cli.nix
        ./git.nix
        ./nvim/neovim.nix
	      ./writing.nix
	      ./teaching.nix
      # ./distrobox-apps.nix
	      ./internet.nix
	      ./graphics.nix
	      ./media.nix
	      ./utilities.nix
	      ./shell.nix
	      ./ghostty/ghostty.nix
        ];

        home.stateVersion = "25.11";
  };
}
