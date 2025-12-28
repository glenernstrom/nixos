{ pkgs, ... }:

{

  powerManagement.enable = true;

  services.logind.settings.Login.HandleLidSwitch = "suspend";

  services.tlp.enable = true;

  hardware.bluetooth.enable = true;

}
