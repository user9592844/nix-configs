{ configVars, ... }:

{
  imports = [
    # Required configs
    common/core

    # Optional configs
    common/optional/browsers/firefox.nix
    common/optional/dev/vscode.nix
    common/optional/sops.nix
  ];

  home = {
    username = configVars.username;
    homeDirectory = "/home/${configVars.username}";
  };
}
