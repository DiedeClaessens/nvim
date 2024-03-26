return {
	"aznhe21/actions-preview.nvim",
	config = function()
		vim.keymap.set({ "v", "n" }, "<leader>ct", require("actions-preview").code_actions)
	end,
}
