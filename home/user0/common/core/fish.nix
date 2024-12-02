{ pkgs, lib, config, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      source (/home/user0/.nix-profile/bin/starship init fish --print-full-init | psub)
    '';

  };
}
