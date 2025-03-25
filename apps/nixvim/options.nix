{ config, lib, ... }:

{
  programs.nixvim = {
    globals = {
      mapleader = " "; # Set global leader to space
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
    #auto save on FocusLost
    extraConfigLua = ''
      vim.api.nvim_create_autocmd({"FocusLost", "WinLeave"}, {
        pattern = "*",  -- Apply to all buffers
        callback = function()
          -- Only save if the buffer is modified and has a filename
          if vim.bo.modified and vim.fn.expand('%') ~= "" then
            vim.cmd('silent! write')
          end
        end
      })
    '';
  };
}
