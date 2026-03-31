{ pkgs, lib, config ... }:

{ 
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "rothko";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Often useful for manual mounts and GUI access to FUSE filesystems
  programs.fuse.userAllowOther = true;


  programs.deconf.profiles.user.dataases = [
   {
     settings = {
      "org/gnome/mutter" = {
        experimental-features = [
          "scale-monitor-framebuffer"
          "variable-refresh-rate"
          "xwayland-native-scaling"
          "autoclose-xwayland"
          ];
        };
      };
    }
  ];
  
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/cpu-intel.nix
  ];
}

