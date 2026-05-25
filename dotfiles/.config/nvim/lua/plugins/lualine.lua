return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            component_separators = { left = "" },
        },
        sections = {},
        inactive_sections = {},
        winbar = {
            lualine_c = { "filename", "diagnostics", "branch" },
        },
        tabline = {},
    },
}
