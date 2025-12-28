{ ... }:

{
  security.sudo.wheelNeedsPassword = true;

  security.polkit.enable = true;

  services.fwupd.enable = true;

  boot.kernel.sysctl = {
    "kernel.sysrq" = 0;
  };
}

