{ ... }:

{
  programs.nixvim = {
    plugins.web-devicons.enable = true;
    # Enable nvim-tree plugin
    plugins.nvim-tree = {
      enable = true;
      view = { side = "right"; };
      # Your existing nvim-tree config (if any)
    };

    # Add transparency config for nvim-tree
    extraConfigLua = ''
      -- First set the colorscheme
      vim.cmd.colorscheme("tokyonight")

      -- Function to apply transparency
      local function make_nvim_tree_transparent()
        local hl_groups = {
          --NvimTree
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeCursorLine",
          "NvimTreeStatusLine",
          "NvimTreeStatusLineNC",
          "NvimTreeVertSplit",
          "NvimTreeEndOfBuffer",
          "NvimTreeWinSeparator",  -- Often missed group
          --Telescope
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",
          "TelescopeSelection",
          "TelescopePromptPrefix",
          "TelescopePromptNormal",
          "TelescopeResultsTitle",
          "TelescopePreviewTitle",
        }

        for _, group in ipairs(hl_groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end

      -- Apply on startup
      make_nvim_tree_transparent()

      -- Re-apply when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = make_nvim_tree_transparent,
      })
    '';
    keymaps = [{
      key = "<leader>b";
      action = ":NvimTreeToggle<CR>";
      mode = "n";
    }];
  };
}
