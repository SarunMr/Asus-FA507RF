{...}:
{
  programs.nixvim ={
    plugins.treesitter ={
      enable = true;
      settings = {
          auto_install = false;
          ensure_installed = [
            "angular"
            "bash"
            "c"
            "cpp"
            "c_sharp"
            "clojure"
            "css"
            "dart"
            "elixir"
            "erlang"
            "lua"
            "fish"
            "html"
            "hyprlang"
            "java"
            "javascript"
            "json"
            "kotlin"
            "nix"
            "php"
            "python"
            "powershell"
            "rust"
            "solidity"
            "swift"
            "typescript"
            "tmux"
            "zig"
          ];
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = true;
          };
          indent.enable = true;
          ignore_install = [
                  "hyprlang"
                  "zig"
                  "clojure"
                  "kotlin"
          ];
incremental_selection = {
  enable = true;
  keymaps = {
    init_selection = null;  # Disable
    node_incremental = null;  # Disable
    ncde_decrementcl = null;  # Disable
    scope_incremental = "grc";  # Keep
    };
  };
      };
    };
  };
}
