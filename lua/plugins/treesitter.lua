return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup({})

      local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match)
          if not lang or not vim.tbl_contains(treesitter.get_available(), lang) then
            return
          end

          local function attach()
            if not vim.api.nvim_buf_is_valid(event.buf)
              or vim.bo[event.buf].filetype ~= event.match then
              return
            end
            vim.treesitter.start(event.buf, lang)
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          if vim.tbl_contains(treesitter.get_installed(), lang) then
            attach()
          else
            treesitter.install({ lang }):await(vim.schedule_wrap(function(err)
              if not err and vim.tbl_contains(treesitter.get_installed(), lang) then
                attach()
              end
            end))
          end
        end,
      })
    end,
  }
}
