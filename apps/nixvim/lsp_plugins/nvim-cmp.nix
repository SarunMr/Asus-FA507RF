{
  programs.nixvim = {
    plugins = {
      #dependencies
      luasnip.enable = true;
      lspkind.enable = true; # Edits inside settings.formatting.format
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
          completion.keyword_length = 2;
          sources = [
            {
              name = "luasnip";
              priority = 1000;
              keyword_length = 1;
            }
            {
              name = "nvim_lsp";
              priority = 850;
              keyword_length = 2;
            }
            {
              name = "buffer";
              priority = 500;
            }
            {
              name = "path";
              priority = 450;
            }
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
          performance.max_view_entries = 15;
          sorting = {
            comparators = [
              "require('cmp.config.compare').offset"
              "require('cmp.config.compare').exact"
              "require('cmp.config.compare').score"
              "require('cmp.config.compare').recently_used"
              "require('cmp.config.compare').locality"
              "require('cmp.config.compare').kind"
              "require('cmp.config.compare').length"
              "require('cmp.config.compare').order"
            ];
          };
          experimental = { ghost_text = true; };
        };
      };
    };
  };
}
