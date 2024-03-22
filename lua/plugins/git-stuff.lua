return {
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>gcm", ":Git commit<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", {})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
    opts ={
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      }
    }
  }
}
