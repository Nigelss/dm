return {
   "ibhagwan/fzf-lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },

   opts = {
      -- "max-perf",
      fzf_colors = {
         ["gutter"] = { "bg", "PmenuSbar" },
      },
   },
   keys = {
      {
         "<leader>cd",
         function()
            require("fzf-lua").files({})
         end,
         desc = "Find files in cwd",
      },
      {
         "<leader>fw",
         function()
            require("fzf-lua").live_grep()
         end,
         desc = "Find word in cwd",
      },
      {
         "<leader>fo",
         function()
            require("fzf-lua").oldfiles()
         end,
         desc = "Find old files",
      },
      {
         "<leader>fc",
         function()
            require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
         end,
         desc = "Neovim configs",
      },
      {
         "<leader>fk",
         function()
            require("fzf-lua").keymaps()
         end,
         desc = "Find defined keymaps",
      },
      {
         "<leader>fr",
         function()
            require("fzf-lua").files({ cwd = vim.fn.expand("~") })
         end,
         desc = "Find files in root",
      },
      {
         "<leader>ft",
         function()
            require("fzf-lua").treesitter()
         end,
         desc = "find treesitter symbols in buffer",
      },
      {
         "<leader>ff",
         function()
            require("fzf-lua").treesitter({
               query = "[function] ",
            })
         end,
         desc = "find function by treesitter in current buffer",
      },
      {
         "<leader>fh",
         function()
            require("fzf-lua").help_tags({})
         end,
         desc = "find help",
      },
      {
         "<leader>gb",
         function()
            require("fzf-lua").git_branches({})
         end,
         desc = "find git branches",
      },
      {
         "<leader>fm",
         function()
            require("fzf-lua").manpages({})
         end,
         desc = "find git branches",
      },
   },
}
