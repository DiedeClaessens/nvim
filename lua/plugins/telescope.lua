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
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fst", builtin.live_grep, { desc = "Search for text" })
      vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Search in op buffers" })
      vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, { desc = "Search for spelling suggestions" })
      vim.keymap.set("n", "<leader>fh", builtin.registers, { desc = "Search for registers" })
      vim.keymap.set("n", "<leader>fd", builtin.resume, { desc = "Resume last search" })

      require("telescope").load_extension("ui-select")

      require "telescope.multigrep".setup()
    end,
  },
}
