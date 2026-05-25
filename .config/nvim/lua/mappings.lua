require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<Down>", "g<Down>", { desc = "Move down visual line" })
map("n", "<Up>", "g<Up>", { desc = "Move up visual line" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>oo", "<cmd>Octo<cr>", { desc = "Octo menu" })

map("n", "<leader>m", ":make<CR>", { desc = "Make" })
vim.keymap.set("n", "<leader>re", function()
  local rom = vim.fn.glob "build/*.gba"
  vim.fn.jobstart { "mgba-qt", rom }
end)

map("n", "gx", function()
  local url = vim.fn.expand "<cfile>"
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end, { desc = "Open URL under cursor" })

map("n", "<leader>gi", function()
  vim.cmd "Octo issue list"
end, { desc = "GitHub Issues" })

map("n", "<leader>gp", function()
  vim.cmd "Octo pr list"
end, { desc = "GitHub PRs" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
