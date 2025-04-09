{ unstablePkgs, ... }:

{
  home.packages = with unstablePkgs; [ zed-editor ];
}
