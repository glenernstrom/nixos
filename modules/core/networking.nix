{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
  };

  #  environment.systemPackages = with pkgs; [
  #    dino
  #  ];

  services.tailscale.enable = true;

  networking.firewall.allowedTCPPorts = [ 8384 ];

 # networking.firewall.allowedUDPPorts = [ 64738 ];
}
