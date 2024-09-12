{ config, lib, pkgs, outputs, configLib, ... }:

{
  imports = (configLib.scanPaths ./.)
    ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = lib.mkDefault "user0";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
  };

  home.packages = builtins.attrValues {
    inherit (pkgs) btop fd lsd nix-tree ripgrep tree unzip unrar wget zip;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = { experimental-features = [ "nix-command" "flakes" ]; };
  };

  programs = { home-manager.enable = true; };

  systemd.user.startServices = "sd-switch";
}
