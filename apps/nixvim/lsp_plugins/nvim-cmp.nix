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
          sorting = {
            comparators = [
              "cmp.config.compare.offset"
              "cmp.config.compare.exact"
              # Prioritize items with higher match score
              "cmp.config.compare.score"
              # Custom comparator for snippet priority after dot
              ''
                function(e1, e2)
                  local cmp = require('cmp')
                  
                  -- Safe context access
                  local ctx = cmp.core:get_context()
                  if not ctx or not ctx.cursor or not ctx.cursor_line then
                    return nil -- Fall back to other comparators
                  end

                  -- Get cursor position safely
                  local line = ctx.cursor_line or ""
                  local col = ctx.cursor.col or 0
                  local before_cursor = line:sub(1, math.max(0, col - 1))

                  -- Only apply special sorting after dots
                  if before_cursor:match("%.$") then
                    -- Safe kind comparison
                    local kind1 = e1 and e1:get_kind() or 0
                    local kind2 = e2 and e2:get_kind() or 0
                    local snippet_kind = cmp.lsp.CompletionItemKind.Snippet

                    -- Prioritize snippets when after a dot
                    if kind1 == snippet_kind and kind2 ~= snippet_kind then
                      return true
                    elseif kind2 == snippet_kind and kind1 ~= snippet_kind then
                      return false
                    end
                  end

                  -- Fall back to default comparison
                  return nil
                end
              ''
              "cmp.config.compare.kind"
              "cmp.config.compare.sort_text"
              "cmp.config.compare.length"
              "cmp.config.compare.order"
            ];
          };
        };
      };
    };
  };
}
