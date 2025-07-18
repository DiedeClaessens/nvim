return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    vim.keymap.set("n", "<leader>n", ":Neogit<CR>", { noremap = true, silent = true, desc = "Neogit" })
  end,
}
