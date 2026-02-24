return {
  "navarasu/onedark.nvim",
  config = function()
    require('onedark').setup {
      style = 'darker',
      colors = {
        -- bg0 = "#0a0c10",   -- Much darker background
        -- bg_d = "#05070a",  -- Even darker variant
        -- bg1 = "#0f1115",   -- Darker bg1 to match
        -- black = "#000000", -- Pure black
        bg0 = "#0f1419",  -- In between: darker than current but not as extreme
        bg_d = "#0a0e13", -- Darker variant
        bg1 = "#141920",  -- Slightly lighter than bg0
        -- black = "#0a0c10", -- Very dark black
        black = "#000000"
      }
    }
    require('onedark').load()
  end
}
