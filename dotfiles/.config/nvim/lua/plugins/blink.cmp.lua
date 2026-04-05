return {
   "saghen/blink.cmp",
   -- optional: provides snippets for the snippet source
   dependencies = { "L3MON4D3/LuaSnip" },
   event = { "BufReadPre", "BufNewFile" },

   version = "1.*",
   -- build = 'cargo build --release',

   ---@module 'blink.cmp'
   ---@type blink.cmp.Config
   opts = {

      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
         preset = "default",
         ["<CR>"] = { "accept", "fallback" },

         ["<Tab>"] = {
            "select_next",
            "snippet_forward",
            function(cmp)
               local function has_words_before()
                  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
                  return col ~= 0
                      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
                      == nil
               end
               if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
                  return cmp.show()
               end
            end,
            "fallback",
         },
         ["<S-Tab>"] = {
            "select_prev",
            "snippet_backward",
            function(cmp)
               if vim.api.nvim_get_mode().mode == "c" then
                  return cmp.show()
               end
            end,
            "fallback",
         },

         ["<M-n>"] = {
            "select_next",
            "snippet_forward",
            function(cmp)
               local function has_words_before()
                  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
                  return col ~= 0
                      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
                      == nil
               end
               if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
                  return cmp.show()
               end
            end,
            "fallback",
         },
         ["<M-p>"] = {
            "select_prev",
            "snippet_backward",
            function(cmp)
               if vim.api.nvim_get_mode().mode == "c" then
                  return cmp.show()
               end
            end,
            "fallback",
         },
      },

      appearance = {
         nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      snippets = { preset = "luasnip" },

      completion = {
         documentation = { auto_show = false },

         list = { selection = { preselect = true, auto_insert = false } },

         menu = {
            auto_show = true,
         },
      },

      sources = {
         default = { "lsp", "path", "buffer" },
         per_filetype = {
            markdown = { "lsp", "path", "buffer", "snippets" },
         },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
   },
   opts_extend = { "sources.default" },
}
