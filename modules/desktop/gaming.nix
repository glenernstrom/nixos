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
    mangohud
    goverlay
    lutris
    heroic
    mesa-demos     # provides glxinfo
    vulkan-tools   # useful for debugging Vulkan/driver stack
  ];
}
