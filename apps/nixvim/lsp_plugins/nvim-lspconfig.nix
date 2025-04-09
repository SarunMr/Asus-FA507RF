{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        pyright.enable = true;
        nixd.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        efm = {
          enable = true;
          filetypes = [
            "sh"
            "python"
            "markdown"
            "yaml"
            "json"
            "javascript"
            "typescript"
            "css" # Non-Java filetypes
          ];
        };
        #Web Devlopment
        html.enable = true;
        cssls.enable = true;
        ts_ls.enable = true;
        eslint.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
