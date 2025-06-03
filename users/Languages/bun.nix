{ unstablePkgs, ... }: { home.packages = with unstablePkgs; [ bun ]; }
