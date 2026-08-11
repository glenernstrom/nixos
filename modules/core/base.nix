{ pkgs, ... }:

{
  system.stateVersion = "26.05";

 # documentation.enable = true;

  nix.settings.download-buffer-size = 524288000;
  
#  fileSystems = {
#    "/".options = [ "compress=zstd" ];
#    "/home".options = [ "compress=zstd" ];
#    "/nix".options = [ "compress=zstd" "noatime" ];
#  };

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.fish = {
    enable = true;
  };
  
  # Enable flatpaks
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    wget
    unzip
  ];

 # environment.localBinInPath = true;
  services.dbus.enable = true;

} 
