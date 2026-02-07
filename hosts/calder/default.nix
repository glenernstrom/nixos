{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "calder";

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-amd.nix
    ../../modules/hardware/nvidia.nix
    ../../modules/desktop/gaming.nix
    ];
}
