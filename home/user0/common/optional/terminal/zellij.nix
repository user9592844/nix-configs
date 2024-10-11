{ pkgs, lib, config, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
