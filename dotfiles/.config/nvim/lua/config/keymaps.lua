vim.g.mapleader = " "
-- leader
vim.g.maplocalleader = " "
-- keymaps

vim.opt.guicursor = "n-v-c-sm:block,i-ci:ver25-Cursor,r-cr-o:hor20"

vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "write buffer to file", silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit", silent = true })
vim.keymap.set("n", "<M-q>", ":q<CR>", { desc = "quit", silent = true })
vim.keymap.set("n", "<leader>so", ":so<CR>", { desc = "source current file", silent = true })
vim.keymap.set("n", "<M-v>", "<C-v>")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })
vim.keymap.set("n", "<C-n>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<C-b>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<M-n>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<M-b>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Increase window width", silent = true })

vim.keymap.set({ "n", "v" }, "<M-d>", "<C-d>zz", { desc = "Half page down centering" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up centering" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down centering" })
vim.keymap.set({ "n", "v" }, "<M-u>", "<C-u>zz", { desc = "Half page up centering" })

-- vim.keymap.set({ "n", "v" }, "<M-e>", ":s/", { desc = "Half page up centering" })
vim.keymap.set("n", "<M-r>", ":Compile<cr>", { desc = "Half page up centering" })

vim.keymap.set("n", "<M-o>", "<C-o>zz")
vim.keymap.set("n", "<M-i>", "<C-i>zz")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set({ "n", "v", 'i' }, "<M-x>", ":", { desc = "faster shortcut for command mode" })
vim.keymap.set({ "n", "v" }, "<M-w>", "<C-w>", { desc = "faster shortcut for switching windows" })
-- vim.keymap.set({ "n", "v" }, "<M-W>", "?", { desc = "faster shortcut for reverse searching" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Open parent directory" })

vim.keymap.set({ "i", "v", "n" }, "<Esc>", function()
   vim.cmd("nohlsearch")
   return vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("n", "<leader>ap", ":e ~/.config/nvim/lua/plugins/", { desc = "add-plugins" })

vim.keymap.set("n", "<leader>zi", function()
   vim.api.nvim_command("VietnameseToggle")
   vim.cmd("startinsert")
end, { silent = true })

-- vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal size=11<cr>", { desc = "open terminal" })
-- vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "floating terminal" })
-- vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=60<cr>", { desc = "vertical split terminal" })
