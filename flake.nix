 {
   description = "Glen's NixOS KDE Plasma config";

   inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
     nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      # url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

   outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }:
     let
       commonNixpkgs = {
         nixpkgs.config.allowUnfree = true;
         # nixpkgs.overlays = [ (final: prev: /* overlay goes here */ ) ];
       };
       system = "x86_64-linux";

      
      commonHM = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      };
    in {
    nixosConfigurations = {
      lutra = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          commonNixpkgs 
          ./hosts/lutra
          ./roles/desktop.nix
          ./modules/core
          ./modules/services
          ./modules/desktop
          home-manager.nixosModules.home-manager
          commonHM
          ./home
        ];
      };
      puma = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
           nix-flatpak.nixosModulues.nix-flatpak
           commonNixpkgs 
           ./hosts/puma
           ./roles/desktop.nix
           ./modules/core
           ./modules/services
           ./modules/desktop
           home-manager.nixosModules.home-manager
           commonHM
          ./home
         ];
       };  
      lynx = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
           nix-flatpak.nixosModules.nix-flatpak
           commonNixpkgs 
           ./hosts/lynx
           ./roles/laptop.nix
           ./modules/core
           ./modules/services
           ./modules/desktop
           home-manager.nixosModules.home-manager
           commonHM
          ./home
         ];
       };
      catharus = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
           commonNixpkgs 
           ./hosts/catharus
           ./roles/laptop.nix
           ./modules/core
           ./modules/services
           ./modules/desktop
           home-manager.nixosModules.home-manager
           commonHM
          ./home
         ];
       };
      loligo = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
           commonNixpkgs 
           ./hosts/loligo
           ./roles/laptop.nix
           ./modules/core
           ./modules/services
           ./modules/desktop
           home-manager.nixosModules.home-manager
           commonHM
          ./home
         ];
       };
     };
   };
 }
