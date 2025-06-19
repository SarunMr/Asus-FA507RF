{ unstablePkgs, ... }:

{
  home.packages = with unstablePkgs; [ postman ];
}
