{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      settings.scope = {
        show_end = false;
        show_exact_scope = true;
        show_start = false;
      };
    };
  };
}
