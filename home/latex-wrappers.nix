{ pkgs, ... }:

let
  latexmk = pkgs.writeShellScriptBin "latexmk" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex -- \
      bash -lc "cd \"$PWD\" && latexmk \"$@\""
  '';

  pdflatex = pkgs.writeShellScriptBin "pdflatex" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex -- \
      bash -lc "cd \"$PWD\" && pdflatex \"$@\""
  '';

  biber = pkgs.writeShellScriptBin "biber" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex -- \
      bash -lc "cd \"$PWD\" && biber \"$@\""
  '';
in
{
  home.packages = [ latexmk pdflatex biber ];
}
