{ pkgs, ... }:

{

#  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "calder";
  boot.supportedFilesystems = [ "apfs" ];

  # Often useful for manual mounts and GUI access to FUSE filesystems
  programs.fuse.userAllowOther = true;
  
   programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/mutter" = {
          experimental-features = [
            "scale-monitor-framebuffer" # Enables fractional scaling (125% 150% 175%)
            "variable-refresh-rate" # Enables Variable Refresh Rate (VRR) on compatible displays
            "xwayland-native-scaling" # Scales Xwayland applications to look crisp on HiDPI screens
            "autoclose-xwayland" # automatically terminates Xwayland if all relevant X11 clients are gone
          ];
        };
      };
    }
  ];

  imports = [
    ./hardware-configuration.nix

    ../../modules/hardware/cpu-amd.nix
    ../../modules/hardware/nvidia.nix
    ];
}
