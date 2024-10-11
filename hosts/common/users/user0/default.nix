{ pkgs, inputs, config, lib, configVars, configLib, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
  sopsHashedPasswordFile = lib.optionalString (lib.hasAttr "sops-nix" inputs)
    config.sops.secrets."${configVars.username}/password".path;

  fullUserConfig = lib.optionalAttrs (!configVars.isMinimal) {
    users.users.${configVars.username} = {
      hashedPasswordFile = sopsHashedPasswordFile;
      packages = [ pkgs.home-manager ];
    };

    # Import user personal configurations
    # TODO: Change the hostname to be multi-host
    home-manager.users.${configVars.username} = import
      (configLib.relativeToRoot "home/${configVars.username}/hostname0.nix");
  };
in {
  config = lib.recursiveUpdate fullUserConfig {
    users.mutableUsers = false;
    users.users.${configVars.username} = {
      home = "/home/${configVars.username}";
      isNormalUser = true;
      password = "hunter2";

      extraGroups = [ "wheel" ]
        ++ ifTheyExist [ "audio" "video" "docker" "git" "networkmanager" ];

      shell = pkgs.fish; # default shell
    };

    # Ensure these are always enabled
    programs.fish.enable = true;
    programs.git.enable = true;
  };
}
