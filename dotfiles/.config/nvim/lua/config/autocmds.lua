local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "Visual",
		})
	end,
})

local dashboard = vim.api.nvim_create_augroup("dashboard", {})

vim.api.nvim_create_autocmd("BufEnter", {
	group = dashboard,
	callback = function()
		vim.schedule(function()
			if vim.fn.expand("%") == "" and vim.bo.filetype == "" and vim.bo.buftype ~= "terminal" then
				vim.keymap.set("n", "s", function()
					local last = vim.v.oldfiles[1]
					vim.cmd("edit " .. vim.fn.fnameescape(last))
				end, { buffer = true, desc = "Open last opened file" })
				vim.keymap.set("n", "f", function()
					require("fzf-lua").files()
				end, { buffer = true, desc = "Find files in cwd" })
				vim.keymap.set("n", "o", function()
					require("fzf-lua").oldfiles()
				end, { buffer = true, desc = "Find old files" })
				vim.keymap.set("n", "c", function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
				end, { buffer = true, desc = "Find config files" })
			end
		end)
	end,
})

local markdown = vim.api.nvim_create_augroup("markdown", {})

vim.api.nvim_create_autocmd("FileType", {
	group = markdown,
	pattern = "markdown",
	callback = function()
		require("luasnip.loaders.from_vscode").lazy_load({})
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("winbar", {}),
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype == "" or filetype == "toggleterm" or filetype == "oil" then
			return
		end
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return
		end
		vim.wo.winbar = "%f %m"
	end,
})
