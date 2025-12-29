{config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      lualine-nvim
      nvim-treesitter
      telescope-nvim
      plenary-nvim
      nvim-web-devicons
    ];
   };

  # Load your Lua config
  xdg.configFile."nvim/init.lua".source = ./nvim/lua/init.lua;

}
