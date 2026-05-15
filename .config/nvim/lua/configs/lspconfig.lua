require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", ".clangd", ".git" },
})
