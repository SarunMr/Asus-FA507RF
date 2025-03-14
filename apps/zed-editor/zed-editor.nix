{...}:

{
  programs.zed-editor={
    enable=true;
    extensions=[
      "night-owlz"
      "java"
      "zed-scss"
      "nix"
      "lua"
    ];
    userSettings={
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
