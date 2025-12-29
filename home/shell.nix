{ config, pkgs, ... }:

{
  programs.bash.enable = true;

  programs.bash.shellAliases = {
    rstudio = "echo \"Use: distrobox-enter -n science-r -- rstudio\"";
    fiji    = "echo \"Use: distrobox-enter -n fiji -- fiji\"";
  };

  
  programs.fish.enable = true;

  programs.fish.shellAliases = {
    rstudio = "echo \"Use: distrobox-enter -n science-r -- rstudio\"";
    fiji    = "echo \"Use: distrobox-enter -n fiji -- fiji\"";
  };
}


