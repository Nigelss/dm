return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    lazy = true,

    event = { "BufReadPost", "BufNewFile" },

    build = "make install_jsregexp",

    config = function()
        local ls = require("luasnip")
        ls.setup({
            enable_autosnippets = false,
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "cpp", "c", "lua", "sh", "org" },
            callback = function()
                ls.config.set_config({ enable_autosnippets = true })
            end,
        })

        require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/config/snippets/" })

        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            ls.jump(1)
        end, { silent = true })
    end,
}
