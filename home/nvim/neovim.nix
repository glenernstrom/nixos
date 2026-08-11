  {config, pkgs, ... }:

  {
    home.packages = with pkgs; [
      ruff
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      withPython3 = false;
      withRuby = false;
      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
      # tokyonight-nvim
        lualine-nvim
        plenary-nvim
        nvim-web-devicons
        nvim-lint
        nvim-lspconfig
      # mason-nvim
      # nvim-treesitter
      ];

      extraPackages = with pkgs; [
        ruff
      ];
   };

    xdg.configFile."nvim/init.lua".source = ./init.lua;
    xdg.configFile."nvim/lua".source = ./lua;

  }
