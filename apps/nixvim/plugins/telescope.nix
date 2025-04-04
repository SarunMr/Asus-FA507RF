{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = {
          action = "git_files";
          options = { desc = "Telescope Git Files"; };
        };
        "<leader>ff" = "live_grep";
      };
    };
  };
}
