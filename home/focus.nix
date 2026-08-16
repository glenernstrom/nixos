{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    joplin-desktop
    blanket
    everdo
    progress-tracker
  ]; 

}
