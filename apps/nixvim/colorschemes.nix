{...}:

{
  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings={
       transparent = true;
       style = "storm"; # Options: storm, night, day, moon
      };
    };
    
    # Status line
    plugins.lualine = {
      enable = true;
      settings={
          options ={
            theme = "tokyonight"; # Match with your colorscheme
          };
      };
    };
  };
}
