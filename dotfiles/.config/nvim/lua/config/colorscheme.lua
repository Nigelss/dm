local M = {}

function M.set_hl()
   vim.cmd('colorscheme retrobox')
   vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
   vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
   vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Normal" })
   vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#fb4934" })

   -- vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#569cd6" })
   -- vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#569cd6" })
   -- vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#569cd6" })
   -- vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#569cd6" })
   -- vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#569cd6" })
end

return M
