{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName  = "Glen Ernstrom";
    userEmail = "otterbrain@protonmail.com";

    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
      ci = "commit";
      lg = "log --oneline --graph --decorate";
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      fetch.prune = true;
      core.editor = "nvim";
      color.ui = "auto";
      credential.helper = "libsecret";
    };
  };

  programs.git.delta.enable = true;
}

