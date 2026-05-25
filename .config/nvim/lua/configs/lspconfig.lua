require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "basedpyright" }
vim.lsp.enable(servers)

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", ".clangd", ".git" },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
  before_init = function(_, config)
    -- auto-detect .venv in project root
    local venv = vim.fn.getcwd() .. "/.venv/bin/python"
    if vim.fn.filereadable(venv) == 1 then
      config.settings.basedpyright.pythonPath = venv
    end
  end,
})
