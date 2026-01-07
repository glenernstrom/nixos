{ pkgs, ... }:

{

  powerManagement.enable = true;

  services.logind.settings.Login.HandleLidSwitch = "suspend";

  services.tlp.enable = false;

  hardware.bluetooth.enable = true;

}
