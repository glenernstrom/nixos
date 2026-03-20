{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "calder";
  boot.supportedFilesystems = [ "apfs" ];

  # Often useful for manual mounts and GUI access to FUSE filesystems
  programs.fuse.userAllowOther = true;

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-amd.nix
    ../../modules/hardware/nvidia.nix
    ];
}
