{ unstablePkgs, ... }: { home.packages = with unstablePkgs; [ R ]; }
