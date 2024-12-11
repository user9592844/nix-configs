{ pkgs, lib, config, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        startup_mode = "Windowed";
        title = "Alacritty";
        dynamic_title = true;
        dimensions = {
          columns = 80;
          lines = 25;
        };
        padding = {
          x = 4;
          y = 4;
        };
      };

      font = {
        size = 13;
        # bold = {
        #   family = "FiraCode Nerd Font";
        #   style = "Bold";
        # };
        # bold_italic = {
        #   family = "FiraCode Nerd Font";
        #   style = "Bold Italic";
        # };
        # italic = {
        #   family = "FiraCode Nerd Font";
        #   style = "Italic";
        # };
        # normal = {
        #   family = "FiraCode Nerd Font";
        #   style = "Regular";
        # };
      };

      keyboard = {
        bindings = [
          {
            key = "c";
            mods = "Control|Shift";
            action = "Copy";
          }
          {
            key = "f";
            mods = "Control";
            action = "ToggleFullscreen";
          }
          {
            key = "n";
            mods = "Control|Shift";
            action = "CreateNewWindow";
          }
          {
            key = "v";
            mods = "Control|Shift";
            action = "Paste";
          }
        ];
      };
    };
  };
}
