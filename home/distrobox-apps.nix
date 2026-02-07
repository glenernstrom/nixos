{ config, pkgs, ... }:

let
  # Read your repo’s bootstrap scripts at eval time and deploy them into ~/.config
  fijiBootstrap = pkgs.writeText "ubuntu-fiji-bootstrap.sh"
    (builtins.readFile ../distrobox/containers/ubuntu-fiji/bootstrap.sh);

  rstudioBootstrap = pkgs.writeText "ubuntu-rstudio-bootstrap.sh"
    (builtins.readFile ../distrobox/containers/ubuntu-rstudio/bootstrap.sh);

  manageApp = pkgs.writeShellApplication {
    name = "distrobox-manage-apps";
    runtimeInputs = with pkgs; [
      distrobox
      podman
      desktop-file-utils
      coreutils
      bash
    ];
    text = builtins.readFile ../distrobox/manage.sh;
  };
in
{
  home.packages = [ manageApp ];

  # Where manage.sh expects these:
  xdg.configFile."distrobox-bootstrap/ubuntu-fiji-bootstrap.sh".source = fijiBootstrap;
  xdg.configFile."distrobox-bootstrap/ubuntu-rstudio-bootstrap.sh".source = rstudioBootstrap;

  # Optional: on-demand user service
  systemd.user.services.distrobox-apps = {
    Unit = {
      Description = "Provision/export Distrobox GUI apps (Fiji, RStudio)";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${manageApp}/bin/distrobox-manage-apps";
    };
    Install = {
      WantedBy = [ ]; # not enabled by default
    };
  };
}

