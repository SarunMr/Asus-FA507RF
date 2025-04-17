{
  programs.nixvim = {
    plugins.efmls-configs = {
      enable = true;
      setup = {
        nix.linter = [ "statix" ];
        css.linter = [ "stylelint" ];
        javascript.linter = [ "eslint" "eslint_d" ];
        typescript.linter = [ "eslint" "eslint_d" ];
        dart.linter = [ "dartanalyzer" ];
      };
      externallyManagedPackages = [ "dartanalyzer" ];
    };
  };
}
