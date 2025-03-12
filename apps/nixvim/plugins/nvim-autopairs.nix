{...}:
{
  programs.nixvim = {
    enable = true;  # Required to enable NixVim
    plugins.nvim-autopairs.enable = true;
  };
}
