{ pkgs, ... }:

{
  # --- Steam ---
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Steam controller / VR / etc udev rules
  hardware.steam-hardware.enable = true;

  # --- Gaming/QoL tools ---
  environment.systemPackages = with pkgs; [
<<<<<<< HEAD
=======
    mesa-demos     # provides glxinfo
    vulkan-tools   # useful for debugging Vulkan/driver stack
>>>>>>> 40c90b075039e4a8e4e654caafc717ea2d3116ac
  ];
}
