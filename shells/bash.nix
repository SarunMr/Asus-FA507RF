let

  myalias = {
    sudo = "sudo ";
    cls = "clear";
    vim = "nvim";
    vi = "nvim";
    nano = "nvim";
    code = "nvim";
    hm = "home-manager";

  };
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myalias;
    initExtra = ''
          	set -o vi
      	eval "$(zoxide init bash)"	
    '';
  };
  home.sessionVariables = {
    EDITOR = "nvim"; # Set default editor
  };
}
