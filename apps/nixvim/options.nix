{config,lib,...}:

{  
  programs.nixvim = {
    globals ={
            mapleader = " ";     # Set global leader to space
            maplocalleader = " ";
    };

    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Tabs & Indentation
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;

      # Line wrapping
      wrap = false;

      # Search
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # Appearance
      termguicolors = true;
      cursorline = true;
      signcolumn = "yes";
      cmdheight = 1;
      scrolloff = 8;
      updatetime = 50;
      colorcolumn = "80";

      # Backups
      swapfile = false;
      backup = false;
      undofile = true;
      undodir = "${config.home.homeDirectory}/.local/nvim/undodir";
      # Misc
      hidden = true;
      mouse = "a";
      clipboard = "unnamedplus";
    };
  };
  home.activation.createUndoDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "${config.home.homeDirectory}/.local/nvim/undodir"
    echo "Undo directory: ${config.home.homeDirectory}/.local/nvim/undodir"
  '';
}
