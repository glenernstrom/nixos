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

    # Reusable module: allow unfree + overlay workaround
    commonNixpkgs = {
      nixpkgs.config.allowUnfree = true;

      nixpkgs.overlays = [
        (final: prev: {
          python313Packages = prev.python313Packages.overrideScope
            (pyFinal: pyPrev: {
              picosvg = pyPrev.picosvg.overridePythonAttrs (old: {
                doCheck = false;
              });

              nanoemoji = pyPrev.nanoemoji.overridePythonAttrs (old: {
                doCheck = false;
              });
            });
        })
      ];
    };

    commonHM = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    };
  in {
    nixosConfigurations = {
      mondrian = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          commonNixpkgs
          ./hosts/mondrian
          ./roles/laptop.nix
          ./modules/core
          ./modules/services
          ./modules/desktop
          home-manager.nixosModules.home-manager
          commonHM
          ./home
        ];
      };

      ernst = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          commonNixpkgs
          ./hosts/ernst
          ./roles/laptop.nix
          ./modules/core
          ./modules/services
          ./modules/desktop
          home-manager.nixosModules.home-manager
          commonHM
          ./home
        ];
      };

      calder = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          commonNixpkgs
          ./hosts/calder
          ./roles/desktop.nix
          ./modules/core
          ./modules/services
          ./modules/desktop
          home-manager.nixosModules.home-manager
          commonHM
          ./home
        ];
      };

      rothko = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          commonNixpkgs
          ./hosts/rothko
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
