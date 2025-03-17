{ pkgs, ... }:

{
  imports = [ ./bash.nix ./starship.nix ];

  #some cli tools
  home.packages = with pkgs; [ zoxide fzf ripgrep bat fd ];
}
