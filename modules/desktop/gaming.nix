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

  environment.systemPackages = with pkgs; [
    aisleriot
  ];
}
