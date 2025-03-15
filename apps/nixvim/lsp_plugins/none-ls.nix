{...}:

{
  programs.nixvim ={
    plugins.none-ls ={
      enable = true;
      sources = {
        diagnostics ={
          checkstyle.enable = true; #linting tool for java
          statix.enable = true;

        };
        formatting ={
          clang_format.enable = true;
          black.enable = true;
          prettier={
                enable = true;
                disableTsServerFormatter=true;
        };
          google_java_format.enable = true;
          nixfmt.enable=true;
          stylua.enable =true;
        };
      };
    };
  };
}
