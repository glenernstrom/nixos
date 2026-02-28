{ ... }:

{
home.sessionPath = [ "$HOME/.local/bin" ];

home.file.".local/bin/latexmk".text = ''
  #!/usr/bin/env bash
  exec distrobox enter latex --workdir "$PWD" -- latexmk "$@"
'';
home.file.".local/bin/pdflatex".text = ''
  #!/usr/bin/env bash
  exec distrobox enter latex --workdir "$PWD" -- pdflatex "$@"
'';
home.file.".local/bin/biber".text = ''
  #!/usr/bin/env bash
  exec distrobox enter latex --workdir "$PWD" -- biber "$@"
'';

home.activation.makeLatexWrappersExecutable = ''
  chmod +x \
    "$HOME/.local/bin/latexmk" \
    "$HOME/.local/bin/pdflatex" \
    "$HOME/.local/bin/biber"
'';
}
