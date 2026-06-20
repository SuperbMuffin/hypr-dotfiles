require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del
local harpoon = require "harpoon"

-- move by visual line
map("n", "<Down>", "g<Down>", { desc = "Move down visual line" })
map("n", "<Up>", "g<Up>", { desc = "Move up visual line" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Harpoon
harpoon:setup()

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add file" })
map("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon toggle menu" })

map("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon go to file 1" })
map("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon go to file 2" })
map("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon go to file 3" })
map("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon go to file 4" })

-- Octo
map("n", "<leader>oo", "<cmd>Octo<cr>", { desc = "Octo menu" })
map("n", "<leader>gi", function()
  vim.cmd "Octo issue list"
end, { desc = "GitHub Issues" })

map("n", "<leader>gp", function()
  vim.cmd "Octo pr list"
end, { desc = "GitHub PRs" })

-- dev
map("n", "<leader>m", ":make<CR>", { desc = "Make" })
map("n", "<leader>mr", ":make run<CR>", { desc = "Make run" })
map("n", "<leader>re", function()
  local rom = vim.fn.glob "build/*.gba"
  vim.fn.jobstart { "mgba-qt", rom }
end)

-- open URL under cursor
map("n", "gx", function()
  local url = vim.fn.expand "<cfile>"
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end, { desc = "Open URL under cursor" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
