-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspcg = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ltex", "texlab", "pyright", "cmake", "lwc-language-server", "lemminx","arduino_language_server"  }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspcg[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
lspcg.grammarly.setup {
  filetypes = { "markdown", "tex" },
}

lspcg.bashls.setup {
  filetypes = { "sh", "bash", "zsh" },
}

lspcg.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
