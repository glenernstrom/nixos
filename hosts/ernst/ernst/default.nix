{ ... }:

{
  networking.hostName = "ernst";

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-intel.nix
  ];
}

