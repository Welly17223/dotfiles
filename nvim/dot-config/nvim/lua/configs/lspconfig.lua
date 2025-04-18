-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspcg = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ltex", "texlab", "cmake", "lemminx", "pylsp", "asm_lsp", "ts_ls", "clangd" }
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

lspcg.arduino_language_server.setup {
  cmd = {
    vim.fn.expand "~/.local/share/nvim/mason/bin/arduino-language-server",
    "-clangd",
    "clangd",
    "-cli",
    "/usr/bin/arduino-cli",
    "-cli-config",
    vim.fn.expand "~/.arduino15/arduino-cli.yaml",
  },
}
