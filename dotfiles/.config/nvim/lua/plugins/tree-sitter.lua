---@diagnostic disable

return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   -- event = { "BufReadPost", "BufNewFile" },
   branch = "main",
   lazy = false,
   dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
   config = function()
      require('nvim-treesitter').setup {
         install_dir = vim.fn.stdpath('data') .. '/site'
      }

      require('nvim-treesitter').install {
         "bash",
         "c",
         "cpp",
         "css",
         "dockerfile",
         "go",
         "html",
         "javascript",
         "json",
         "lua",
         "markdown",
         "markdown_inline",
         "python",
         "rust",
         "typescript",
         "yaml",
         'rust',
         'zig',
         'cmake',
      }
      vim.api.nvim_create_autocmd('FileType', {
         pattern = { 'cmake' },

         callback = function()
            vim.treesitter.start()
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
         end,
      })
   end,
}
