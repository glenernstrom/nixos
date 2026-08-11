{ pkgs, ...}:

{

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "lutra";
 # boot.supportedFilesystems = [ "apfs" ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/cpu-amd.nix
    ../../modules/hardware/nvidia.nix
  ];
}
