{ pkgs, inputs, config, configVars, ... }:
let
  secretsDirectory = builtins.toString inputs.nix-secrets;
  secretsFile = "${secretsDirectory}/secrets.yaml";

  homeDirectory = if pkgs.stdenv.isLinux then
    "/home/${configVars.username}"
  else
    "/Users/${configVars.username}";
in {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretsFile}";
    validateSopsFiles = false;

    age.keyFile = "${homeDirectory}/.config/sops/age/key.txt";

    secrets = {
      "user_age_keys/${configVars.username}_${config.networking.hostName}" = {
        owner = config.users.users.${configVars.username}.name;
        inherit (config.users.users.${configVars.username}) group;
        path = "${homeDirectory}/.config/sops/age/keys.txt";
      };

      "${configVars.username}_passwd".neededForUsers = true;

      # "yubico/u2f_keys" = {
      #   path = "/home/${configVars.username}/.config/Yubico/u2f_keys";
      # };
    };
  };

  system.activationScripts.sopsSetAgeKeyOwnership = let
    ageFolder = "${homeDirectory}/.config/sops/age";
    user = config.users.users.${configVars.username}.name;
    group = config.users.users.${configVars.username}.group;
  in ''
    mkdir -p ${ageFolder} || true
    chown -R ${user}:${group} ${homeDirectory}/.config
  '';
}
