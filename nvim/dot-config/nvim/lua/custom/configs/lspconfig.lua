local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "cssls", "tsserver", "pyright", "pylsp", "vimls", "texlab" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- the extra lsp installed by Mason --
lspconfig.yamlls.setup {}
-- lspconfig.pyright.setup {}
lspconfig.bashls.setup {
  filetypes = { "sh", "zsh" },
}
lspconfig.jdtls.setup {
  cmd = { "jdtls" },
}
lspconfig.grammarly.setup {
  filetypes = { "markdown", "tex", "text" },
}
lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cc", "arduino" },
}
lspconfig.html.setup {
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript" },
}
lspconfig.ltex.setup{
  filetypes = { "latex", "tex", "markdown" },
  enabled = { "latex", "tex", "markdown" },
}
