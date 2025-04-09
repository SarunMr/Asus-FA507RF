{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    settings = {
      user_default_options = {
        names = false; # Disable color name recognition
        RRGGBB = true; # Parse #RRGGBB hex codes
        AARRGGBB = true; # Parse #AARRGGBB hex codes
        rgb_fn = true; # Parse rgb() functions
        hsl_fn = true; # Parse hsl() functions
        css = true; # Enable CSS color parsing
        css_fn = true; # Parse CSS function colors
      };
      filetypes = {
        __unkeyed-1 = "*";
        __unkeyed-2 = "!vim";
        css = { names = true; };
        html = { names = true; };
        scss = { names = true; }; # Add Sass if needed
        javascriptreact = { names = true; }; # For JSX
      };
      user_commands = [ "ColorizerToggle" "ColorizerReloadAllBuffers" ];
    };
  };
}
