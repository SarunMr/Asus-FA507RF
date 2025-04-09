{
  programs.nixvim = {
    plugins.efmls-configs = {
      enable = true;
      setup = { nix.linter = [ "statix" ]; };
    };
  };
}
