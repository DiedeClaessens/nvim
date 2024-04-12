return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			--			vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fst", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
			vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, {})
			vim.keymap.set("n", "<leader>fh", builtin.highlights, {})
			vim.keymap.set("n", "<leader>fr", builtin.registers, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
