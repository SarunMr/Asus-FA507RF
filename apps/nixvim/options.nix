{...}

{
  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = ",";

    options = {
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
      undodir = "~/.vim/undodir";

      # Misc
      hidden = true;
      mouse = "a";
    };
  };
}
