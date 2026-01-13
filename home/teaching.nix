{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xournalpp
    rnote
    anki
    tesseract4
  ];
}
