{ pkgs, ... }:

{

  powerManagement.enable = true;

  services.logind.lidSwitch = "suspend";

  services.tlp.enable = true;

  hardware.bluetooth.enable = true;

}
