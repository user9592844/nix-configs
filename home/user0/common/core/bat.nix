{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      style = "numbers,changes,header";
      theme = "gruvbox-dark";
    };
    extraPackages =
      builtins.attrValues { inherit (pkgs.bat-extras) batgrep batdiff batman; };
  };
}
