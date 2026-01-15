{ ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
  };

  services.tailscale.enable = true;
  networking.firewall.allowedTCPPorts = [ 64738 ];
  networking.firewall.allowedUDPPorts = [ 64738 ];
}

