return {
    "leath-dub/snipe.nvim",
    keys = {
        {
            "fb",
            function()
                require("snipe").open_buffer_menu()
            end,
            desc = "Open Snipe buffer menu",
        },
    },
    opts = {
        ui = {
            position = "center",
            open_win_override = {
                border = "rounded",
            },
        },
        hints = {
            -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
            ---@type string
            dictionary = "asdfghlewcmpio",
            -- Character used to disambiguate tags when 'persist_tags' option is set
            prefix_key = ".",
        },
    },
}
