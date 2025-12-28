{ ... }:

{

 nixpkgs.config.allowUnfree = true;

 nix.settings = {
   experimental-features = [ "nix-command" "fales"]; 
   auto-optimise-store = true;
   };
}
