{ pkgs, ... }:

{
  imports = [ ./bash.nix ./starship.nix ./tmux.nix ];

  #some cli tools
  home.packages = with pkgs; [ zoxide fzf ripgrep bat fd ];
}
