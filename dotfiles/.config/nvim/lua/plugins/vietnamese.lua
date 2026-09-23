return {
	"sontungexpt/vietnamese.nvim",
	config = function()
		local M = require("vietnamese.notifier")
		M.info = function() end

		require("vietnamese").setup({ enabled = false })
	end,
}
