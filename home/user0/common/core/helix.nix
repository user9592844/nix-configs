{ pkgs, lib, config, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      editor = {
        line-number = "absolute";
        mouse = false;
        auto-completion = true;
        auto-save = true;
        auto-format = true;
        text-width = 120;
        gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];

        soft-wrap = {
          enable = true;
          max-indent-retain = 80;
        };

        file-picker.hidden = false;

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-modification-indicator"
            "read-only-indicator"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "register"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "|";
          mode.normal = "LOCKED";
          mode.insert = "WORKING";
          mode.select = "VISUAL SEL";
        };

        lsp = {
          enable = true;
          auto-signature-help = true;
          display-messages = true;
        };

        indent-guides = {
          render = true;
          character = "|";
          skip-levels = 1;
        };
      };
    };

    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };
}
