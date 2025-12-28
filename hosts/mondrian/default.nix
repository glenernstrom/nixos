{ ... }:

{
  networking.hostName = "mondrian";

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-amd.nix
  ];
}
