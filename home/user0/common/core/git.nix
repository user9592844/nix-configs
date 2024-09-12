{ pkgs, lib, config, configLib, configVars, ... }:
let
  handle = configVars.handle;
  publicGitEmail = configVars.gitHubEmail;
  publicKey = "${config.home.homeDirectory}/.ssh/id_github.pub";
in {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = handle;
    userEmail = publicGitEmail;
    aliases = { };
    extraConfig = {
      init.defaultBranch = "main";
      url = {
        "ssh://git@github.com" = { insteadOf = "https://github.com"; };
        "ssh://git@gitlab.com" = { insteadOf = "https://gitlab.com"; };
      };
      signing = {
        signByDefault = true;
        key = publicKey;
      };
      # ignores = [ ".direnv" "result" ];
    };
  };
}
