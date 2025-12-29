{ config, pkgs, lib, ... }:

{
  # Enable proprietary NVIDIA driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false; # RTX 3080 Ti requires proprietary driver
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # New option name (replaced hardware.opengl.*)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Required for NVIDIA + Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}

