return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		-- As an example, we will create the following mappings:
		--  * <leader>ff find files
		--  * <leader>fr show recent files
		--  * <leader>fb Foobar
		-- we'll document:
		--  * <leader>fn new file
		--  * <leader>fe edit file
		-- and hide <leader>1

		wk.register({
			f = {
				name = "file", -- optional group name
				f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
			},
		}, { prefix = "<leader>" })
	end,
}
