return {
	{
		"mfussenegger/nvim-dap",
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	{
		"Mathijs-Bakker/godotdev.nvim",
		dependencies = { "nvim-dap", "nvim-dap-ui", "nvim-treesitter" },
		config = function()
			require("godotdev").setup({ csharp = true })
		end,
	},
}
