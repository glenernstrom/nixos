{config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      lualine-nvim
      telescope-nvim
      plenary-nvim
      nvim-web-devicons
      nvim-treesitter
    ];
   };

  # Load your Lua config
  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua".source = ./lua;

}
