{ ... }: {
  programs.nixvim = {
    plugins = {
      #dependencies
      luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      friendly-snippets.enable = true;

      cmp = {
        enable = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            { name = "luasnip"; }
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<Tab>" = "cmp.mapping.select_next_item()";
          };
          formatting = {
            format = ''
              function(entry, vim_item)
                -- Set maximum width for item
                local label = vim_item.abbr
                local truncated_label = vim.fn.strcharpart(label, 0, 50)
                if truncated_label ~= label then
                  vim_item.abbr = truncated_label .. "..."
                end
                
                -- Source names
                vim_item.menu = ({
                  nvim_lsp = "[LSP]",
                  luasnip = "[Snippet]",
                  buffer = "[Buffer]",
                  path = "[Path]",
                })[entry.source.name]
                
                return vim_item
              end
            '';
          };
        };
      };
    };
  };
}
