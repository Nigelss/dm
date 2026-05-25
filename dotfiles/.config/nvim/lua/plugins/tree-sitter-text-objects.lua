return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        vim.g.no_plugin_maps = true
    end,
    config = function()
        vim.keymap.set({ "x", "o" }, "af", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
        end, { desc = "Select outer part of function" })

        vim.keymap.set({ "x", "o" }, "if", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
        end, { desc = "Select inner part of function" })

        vim.keymap.set({ "x", "o" }, "ac", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
        end, { desc = "Select outer part of class" })

        vim.keymap.set({ "x", "o" }, "ic", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
        end, { desc = "Select inner part of class" })

        vim.keymap.set({ "x", "o" }, "ao", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
        end, { desc = "Select outer part of loop" })

        vim.keymap.set({ "x", "o" }, "ai", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
        end, { desc = "Select inner part of loop" })

        vim.keymap.set({ "x", "o" }, "ai", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
        end, { desc = "Select outer part of conditional" })

        vim.keymap.set({ "x", "o" }, "ii", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
        end, { desc = "Select inner part of conditional" })

        -- vim.keymap.set({ "x", "o" }, "as", function()
        --    require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
        -- end)
    end,
}
