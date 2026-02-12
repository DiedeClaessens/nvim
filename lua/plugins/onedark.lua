return {
  "navarasu/onedark.nvim",
  config = function()
    require('onedark').setup {
      style = 'darker',
      colors = {
        bg0 = "#0a0c10",   -- Much darker background
        bg_d = "#05070a",  -- Even darker variant
        bg1 = "#0f1115",   -- Darker bg1 to match
        black = "#000000", -- Pure black
      }
    }
    require('onedark').load()
  end
}
