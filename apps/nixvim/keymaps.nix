{...}

{
  programs.nixvim.maps = {
    normal = {
      # Basic navigation
      "<C-h>" = { action = "<C-w>h"; };
      "<C-j>" = { action = "<C-w>j"; };
      "<C-k>" = { action = "<C-w>k"; };
      "<C-l>" = { action = "<C-w>l"; };

      # Resize windows
      "<C-Up>" = { action = ":resize -2<CR>"; };
      "<C-Down>" = { action = ":resize +2<CR>"; };
      "<C-Left>" = { action = ":vertical resize -2<CR>"; };
      "<C-Right>" = { action = ":vertical resize +2<CR>"; };

      # Move text up and down
      "<A-j>" = { action = ":m .+1<CR>=="; };
      "<A-k>" = { action = ":m .-2<CR>=="; };

      # Buffer navigation
      "<S-l>" = { action = ":bnext<CR>"; };
      "<S-h>" = { action = ":bprevious<CR>"; };

      # Clear search highlighting
      "<leader>h" = { action = ":nohlsearch<CR>"; };

      # Save file
      "<leader>w" = { action = ":w<CR>"; };

      # Quit
      "<leader>q" = { action = ":q<CR>"; };
      
      # Close buffer
      "<leader>c" = { action = ":bd<CR>"; };
    };

    visual = {
      # Stay in indent mode when changing indentation
      "<" = { action = "<gv"; };
      ">" = { action = ">gv"; };

      # Move text up and down
      "<A-j>" = { action = ":m .+1<CR>=="; };
      "<A-k>" = { action = ":m .-2<CR>=="; };
    };

    terminal = {
      # Exit terminal mode
      "<Esc>" = { action = "<C-\\><C-n>"; };
    };
  };
}
