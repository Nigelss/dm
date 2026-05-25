local M = {}

function M.vscode()
    vim.cmd('colorscheme vscode')
    vim.api.nvim_set_hl(0, "Statement", { fg = "#569cd6" })
    vim.api.nvim_set_hl(0, "Conditional", { fg = "#569cd6" })
    vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#569cd6" })
    vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#569cd6" })
    vim.api.nvim_set_hl(0, "Repeat", { fg = "#569cd6" })
end

function M.retro()
    vim.cmd('colorscheme retrobox')
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#fb4934" })
end

return M
