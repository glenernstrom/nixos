{ pkgs, ... }:

let
  lucidaFonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "lucida-fonts";
    version = "1.0";

    src = ../../fonts/lucida;

    installPhase = ''
      mkdir -p $out/share/fonts/truetype/lucida
      cp *.ttf $out/share/fonts/truetype/lucida/
    '';
  };
in
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      dejavu_fonts
      fira-code
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      adwaita-fonts
      lucidaFonts
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [
          "Lucida Sans"
          "Noto Sans"
          "DejaVu Sans"
        ];

        serif = [
          "Lucida Bright"
          "Noto Serif"
          "DejaVu Serif"
        ];

        monospace = [
          "Lucida Typewriter"
          "JetBrains Mono"
          "DejaVu Sans Mono"
        ];
      };

      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>

          <alias>
            <family>sans-serif</family>
            <prefer>
              <family>Lucida Sans</family>
            </prefer>
          </alias>

          <alias>
            <family>serif</family>
            <prefer>
              <family>Lucida Bright</family>
            </prefer>
          </alias>

          <alias>
            <family>monospace</family>
            <prefer>
              <family>Lucida Typewriter</family>
            </prefer>
          </alias>

        </fontconfig>
      '';
    };
  };
}
