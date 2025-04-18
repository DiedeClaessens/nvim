-- some tab stuf
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- change leader to space
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- Move line up or down
-- single-line
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")

-- multi-line
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.cmd("set scrolloff=10")

-- some nice keymaps
vim.keymap.set("n", "<leader>yy", '<cmd>let @+ = expand("%:p")<CR>')
-- quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- Some Buffer stuff
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Relative line nummbers
vim.wo.relativenumber = true

-- Terminal shortkey
vim.keymap.set("n", "<leader>tt", "<cmd>vsplit term://fish<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- Change Hgate to HGate
vim.keymap.set("n", "<leader>h", "<cmd>s/Hgate/HGate/g<CR>")
-- dbg

-- Function to load failed tests into quickfix with full paths
function LoadFailedTestsToQF()
  local cwd = vim.fn.getcwd()
  local cmd =
  "mix test --failed | grep -E 'test/[^[:space:]:]+\\.exs:[0-9]+' | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//' | sort -u"
  local result = vim.fn.systemlist(cmd)
  print("Testing...")

  if #result > 0 then
    local quickfix_items = {}

    for _, line in ipairs(result) do
      print("Failed test: " .. line)

      local full_path = cwd .. "/" .. line:match("^(.-):")
      local line_num = tonumber(line:match(":(%d+)$"))

      if full_path and line_num then
        table.insert(quickfix_items, { filename = full_path, lnum = line_num })
      else
        print("Skipping invalid entry: " .. line)
      end
    end

    if #quickfix_items > 0 then
      vim.fn.setqflist(quickfix_items, 'r')
      vim.cmd("copen")
      vim.cmd("cfirst")
    else
      print("No valid test entries in quickfix list.")
    end
  else
    -- If no failed tests are found, notify the user
    print("No failed tests found.")
  end
end

vim.api.nvim_create_user_command("LoadFailedTestsQF", LoadFailedTestsToQF, {})
vim.keymap.set('n', '<leader>ft', LoadFailedTestsToQF,
  { noremap = true, silent = true, desc = "Load failed tests into quickfix" })
vim.keymap.set("n", "<leader>cj", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>ck>", "<cmd>cprev<CR>")

-- Load all occurenses of dbg into quickfix
vim.keymap.set("n", "<leader>dbg", function()
  local cmd = "rg -e dbg --color=never --no-heading --with-filename --line-number --column --smart-case"
  local output = vim.fn.systemlist(cmd)
  vim.fn.setqflist({}, " ", { lines = output, title = "Ripgrep dbg" })
  vim.cmd("copen")
end, { desc = "Search for 'dbg' with rg and load into quickfix" })

vim.keymap.set("n", "<leader>mt", function()
  vim.cmd("terminal mix test")
end, {desc = "Run mix test"})


vim.keymap.set("n", "<leader>mtf", function()
  vim.cmd("terminal mix test " .. vim.fn.expand("%"))
end, {desc = "Run mix test for current file"})



vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "-", "<cmd>e .<CR>")
