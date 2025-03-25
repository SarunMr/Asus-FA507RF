let

  myalias = {
    sudo = "sudo ";
    cls = "clear";
    vim = "nvim";
    vi = "nvim";
    nano = "nvim";
    code = "nvim";
    hm = "home-manager ";

  };
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myalias;
    initExtra = ''
            # Conditional guard for Bash-only features
              eval "$(zoxide init bash)"  
      if [ -n "$BASH_VERSION" ]; then
          shopt -s progcomp
          set -o vi
      fi
    '';
  };
  home.sessionVariables = {
    EDITOR = "nvim"; # Set default editor
  };
}
