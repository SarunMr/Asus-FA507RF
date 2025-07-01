let
  myalias = {
    sudo = "sudo ";
    cls = "clear";
    vim = "nvim";
    vi = "nvim";
    nano = "nvim";
    code = "nvim";
    hms = "home-manager switch --flake .";
    hmg = "home-manager generations";
    hmrg = "home-manager remove-generations";
    up = "cd ..";

  };
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myalias;
    initExtra = ''
      if [ -n "$BASH_VERSION" ]; then
          shopt -s progcomp
          set -o vi
      fi
    '';
  };
  programs.zoxide.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim"; # Set default editor
  };
}
