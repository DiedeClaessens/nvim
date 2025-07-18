return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add current file to Harpoon list" })
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Toggle Harpoon quick menu" })

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select 1st file in Harpoon list" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select 2nd file in Harpoon list" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select 3rd file in Harpoon list" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select 4th file in Harpoon list" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Select 5th file in Harpoon list" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>j", function() harpoon:list():prev() end, { desc = "Go to previous file in Harpoon list" })
    vim.keymap.set("n", "<leader>k", function() harpoon:list():next() end, { desc = "Go to next file in Harpoon list" })
  end
}
