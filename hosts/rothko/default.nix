{ ... }:

{
  networking.hostName = "rothko";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Often useful for manual mounts and GUI access to FUSE filesystems
  programs.fuse.userAllowOther = true;


  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-intel.nix
  ];
}

