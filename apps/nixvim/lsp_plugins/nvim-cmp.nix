{ ... }: {
  programs.nixvim = {
    plugins = {
      #dependencies
      luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;

      cmp = {
        enable = true;
        settings = {
          snippets.exapand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            {
              name = "nvim_lsp";
              priority = 1000;
            }
            {
              name = "luasnip";
              priority = 750;
            }
            {
              name = "buffer";
              priority = 500;
            }
            {
              name = "path";
              priority = 250;
            }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" =
              "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
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
    extraConfigLua = ''
      -- Extra LSP configurations if needed
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Enhancing LSP setup
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf
          
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    '';
  };
}
