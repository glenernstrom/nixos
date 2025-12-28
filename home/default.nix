{ pkgs, ... }:

  {
    home-manager.users.otterbrain = {
      imports = [
      #  ./cli.nix
        ./git.nix
      #  ./neovim.nix
        ./gnome.nix
	./reading.nix
	./writing.nix
	./teaching.nix
	./science.nix
	./internet.nix
	./graphics.nix
	./media.nix
	./coding.nix
	./utilities.nix
        ];

        home.stateVersion = "25.11";
    };
  }
