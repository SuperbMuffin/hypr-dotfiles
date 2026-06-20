require "nvchad.options"

-- add yours here!
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
