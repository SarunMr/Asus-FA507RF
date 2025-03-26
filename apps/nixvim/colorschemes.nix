{ pkgs, ... }:

{
  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        transparent = true;
        style = "storm"; # Options: storm, night, day, moon
        on_highlights = ''
          function(highlights, colors)
            highlights.LineNr = { fg = "#ffffff" }
          end
        '';
      };
    };
    colorschemes.rose-pine = {
      enable = false;
      settings.styles = {
        bold = false;
        italic = true;
        transparency = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [{
      plugin = night-owl-nvim;
      config = ''
        lua << EOF
        require('night-owl').setup({
          transparent_background = true,
          italics = true
        })
        EOF
      '';
    }];
    # Status line
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto"; # Match with your colorscheme
        };
      };
    };
  };
}
