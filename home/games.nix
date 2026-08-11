{ config, pkgs , ... }:

{

 home.packages = with pkgs; [
  lutris
  gnome-sudoku
  aisleriot
 ];

}
