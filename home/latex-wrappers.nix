{ pkgs, ... }:

let
  latexmk = pkgs.writeShellScriptBin "latexmk" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex --workdir "$PWD" -- latexmk "$@"
  '';

  pdflatex = pkgs.writeShellScriptBin "pdflatex" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex --workdir "$PWD" -- pdflatex "$@"
  '';

  biber = pkgs.writeShellScriptBin "biber" ''
    exec ${pkgs.distrobox}/bin/distrobox enter latex --workdir "$PWD" -- biber "$@"
  '';
in
{
  # put wrappers on PATH
  home.packages = [ latexmk pdflatex biber ];

  # optional: keep ~/.local/bin early too, but not required now
  # home.sessionPath = [ "$HOME/.local/bin" ];
}
