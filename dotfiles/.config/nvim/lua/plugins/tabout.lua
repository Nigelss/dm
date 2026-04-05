return {
   "abecodes/tabout.nvim",
   event = "VeryLazy",
   dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
   },
   opts = {
      tabouts = {
         { open = "'", close = "'" },
         { open = '"', close = '"' },
         { open = '`', close = '`' },
         { open = '(', close = ')' },
         { open = '[', close = ']' },
         { open = '{', close = '}' },
         { open = '<', close = '>' }
      },
   },
}
