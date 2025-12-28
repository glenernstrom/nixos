{ ... }:

{

  networking.hostName = "calder";

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-amd.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/desktop/gaming.nix
    ];
}
