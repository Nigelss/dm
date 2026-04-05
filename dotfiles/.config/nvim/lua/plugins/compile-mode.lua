return {
   "ej-shafran/compile-mode.nvim",
   branch = "latest",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "m00qek/baleia.nvim" },
   },
   config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
         -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
         -- set this to fix tab completion in command mode:
         input_word_completion = true,

         -- to add ANSI escape code support, add:
         baleia_setup = true,

         -- to make `:Compile` replace special characters (e.g. `%`) in
         -- the command (and behave more like `:!`), add:
         bang_expansion = true,

         default_command = {
            -- python = "python %",
            -- lua = "lua %",
            -- javascript = "bun %",
            -- typescript = "bun %",
            -- c = "cc -o %:r % && ./%:r",
            -- cpp = "cc -std=c++23 -o %:r % && ./%:r",
            -- java = "javac % && java %:r",
            go = "go run .",
         },
      }
   end
}
