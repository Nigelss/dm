local servers = { "lua_ls", "clangd", "cmake", "bashls", "pyright", "tinymist", "java-language-server", "jdtls", "zls",
   "gopls" }

vim.lsp.enable(servers)

vim.diagnostic.config({
   virtual_text = true,
   signs = false,
})

vim.lsp.config("bashls", {
   filetypes = { "bash", "zsh", "sh", "command", "inc" },
})

vim.lsp.config("clangd", {
   cmd = { "clangd", "--header-insertion=never", "--limit-references=80", "--limit-results=30", "-j", "2" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
   callback = function()
      vim.diagnostic.hide()
   end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
   callback = function()
      vim.diagnostic.show()
   end,
})

vim.keymap.set("n", "gd", function()
   vim.lsp.buf.definition()
end, { desc = "show definitions" })

vim.lsp.handlers["$/progress"] = function() end
