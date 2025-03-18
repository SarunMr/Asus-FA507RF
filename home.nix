{ ... }:

{
  imports = [ ./shells ./apps ./users ];

  home.username = "sarun";
  home.homeDirectory = "/home/sarun";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;
  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}
