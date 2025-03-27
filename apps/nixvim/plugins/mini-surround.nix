{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [{
      plugin = mini-surround;
      config = ''
        lua << EOF
        require("mini.surround").setup()
        EOF
      '';
    }];
  };
}
