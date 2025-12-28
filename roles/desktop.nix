{ ... }:

{
  services.logind.settings.Login.HandleLidSwitch = "ignore";

  powerManagement.enable = false;
}
