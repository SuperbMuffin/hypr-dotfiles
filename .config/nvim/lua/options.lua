require "nvchad.options"

-- add yours here!
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = { "en_us" }
    end,
})
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
