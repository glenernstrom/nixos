{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    user.name = "Glen Ernstrom";
    user.email = "otterbrain@protonmail.com";

    alias = {
      co = "checkout";
      br = "branch";
      st = "status";
      ci = "commit";
      lg = "log --oneline --graph --decorate";
    };

    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      fetch.prune = true;
      core.editor = "nvim";
      color.ui = "auto";
      credential.helper = "libsecret";
    };
  };

  programs.delta.enable = true;
  programs.delta.enableGitIntegration = true;
}

