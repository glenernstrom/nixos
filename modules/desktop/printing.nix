{ config, pkgs, ... }:

{
  services.printing = {
    enable = true; 
    webInterface = true;

     drivers = [
       pkgs.gutenprint
       pkgs.hplip
     ];
   };

  hardware.sane.enable = true;

   services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing.browsing = true;

 # Access CUPS at http://localhost:631
 # The Given C453 printer is socket://132.198.81.15
 # Konica-Minolta Drivers: https://www.btapac.konicaminolta.com/index.html
 # Default settings are fine except I generally prefer 1-side page printing

  environment.systemPackages = with pkgs; [
    system-config-printer
    kdePackages.print-manager
  ];
}
