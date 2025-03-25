{
  programs.nixvim = {
    keymaps = [
      #Normal mode keybindings
      {
        mode = "n";
        key = "<C-h>";
        action = ":wincmd h<CR>";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = ":wincmd j<CR>";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = ":wincmd k<CR>";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = ":wincmd l<CR>";
      }

      {
        mode = "n";
        key = "<C-Up>";
        action = ":resize -2<CR>";
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = ":resize +2<CR>";
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = ":vertical resize -2<CR>";
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = ":vertical resize +2<CR>";
      }

      {
        mode = "n";
        key = "<A-j>";
        action = ":m .+1<CR>==";
      }
      {
        mode = "n";
        key = "<A-k>";
        action = ":m .-2<CR>==";
      }

      {
        mode = "n";
        key = "<S-l>";
        action = ":bnext<CR>";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = ":bprevious<CR>";
      }

      {
        mode = "n";
        key = "<leader>h";
        action = ":nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = ":q<CR>";
      }
      {
        mode = "n";
        key = "<leader>c";
        action = ":bd<CR>";
      }

      {
        mode = "n";
        key = "<leader>qq";
        action = ":q!<CR>";
      }
      # Visual mode keybindings
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
      {
        mode = "v";
        key = "<A-j>";
        action = ":m .+1<CR>==";
      }
      {
        mode = "v";
        key = "<A-k>";
        action = ":m .-2<CR>==";
      }

      # Terminal mode keybindings
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
      }

      # Additional keybindings
      {
        mode = "n";
        key = "<leader>m";
        options.silent = true;
        action = "<cmd>!make<CR>";
      }
    ];
  };
}
