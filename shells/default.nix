{ pkgs, ... }:

{
  imports = [ ./bash.nix ./starship.nix ./tmux.nix ./git.nix ./pgcli.nix ];

  #some cli tools
  home.packages = with pkgs; [ fzf ripgrep fd bat unzip ];
}
