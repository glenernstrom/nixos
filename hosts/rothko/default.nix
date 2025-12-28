{ ... }:

{
  networking.hostName = "desktop-2";

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-intel.nix
  ];
}

