{ pkgs, ... }:

{
  imports = [
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}

