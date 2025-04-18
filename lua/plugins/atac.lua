return {
		"NachoNievaG/atac.nvim",
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			require("atac").setup({
				dir = "/Users/diede/dev/atac-collections/hg2",
			})
		end,
	}
