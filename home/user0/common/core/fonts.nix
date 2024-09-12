{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.fira-code
    pkgs.fira-mono
    pkgs.fira-code-symbols
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
