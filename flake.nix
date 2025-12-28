{
  description = "Glen's NixOS multimachine config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      mondrian = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./hosts/mondrian
	  ./roles/laptop.nix
	  ./modules/core
	  ./modules/services
	  ./modules/desktop
	  home-manager.nixosModules.home-manager
	  ./home
	];
      };

      ernst = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./hosts/ernst
	  ./roles/laptop.nix
	  ./modules/core
	  ./modules/services
	  ./modules/desktop
	  home-manager.nixosModules.home-manager
	  ./home
	 ];
       };

      calder = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./hosts/calder
	  ./roles/desktop.nix
	  ./modules/core
	  ./modules/services
	  ./modules/desktop
	  home-manager.nixosModules.home-manager
	  ./home
	 ];
       };

       rothko = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./hosts/rothko
	  ./roles/laptop.nix
	  ./modules/core
	  ./modules/services
	  ./modules/desktop
	  home-manager.nixosModules.home-manager
	  ./home
	 ];
       };
     };
   };
}
