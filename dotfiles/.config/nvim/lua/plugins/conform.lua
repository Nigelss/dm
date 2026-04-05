return {
   "stevearc/conform.nvim",
   event = { "BufReadPre", "BufNewFile" },
   opts = {
      formatters_by_ft = {
         lua = { "stylua" },
         cpp = { "clang-format" },
         c = { "clang-format" },
         python = { "isort", "black" },
         cmake = { "gersemi" },
         -- You can customize some of the format options for the filetype (:help conform.format)
         rust = { "rustfmt" },
         typst = { "typstyle" },
         -- go = { "go" }
      },
      format_on_save = {
         timeout_ms = 500,
         lsp_format = "fallback",
      },
   },
}
