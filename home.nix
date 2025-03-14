{  pkgs, ... }:

{
  imports = [
    ./shells/bash.nix  # Correct relative path
    ./apps
  ];

  home.username = "sarun";
  home.homeDirectory = "/home/sarun";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;
  home.packages = with pkgs; [ 
	zoxide

  ];

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}

