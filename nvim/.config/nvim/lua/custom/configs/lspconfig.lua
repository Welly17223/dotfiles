local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "cssls", "tsserver", "html", "clangd", "pyright" }

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
lspconfig.texlab.setup {}
lspconfig.jdtls.setup {
  cmd = { "jdtls" },
}
lspconfig.grammarly.setup {
  filetypes = { "markdown", "tex", "text" },
}
lspconfig.ltex.setup {}
lspconfig.pylsp.setup {}

lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    " -clangd /usr/local/bin/clangd",
    " -cli /usr/local/bin/arduino-cli",
    " -cli-config $HOME/.arduino15/arduino-cli.yaml",
  },
  filetypes = { "arduino" },
}
--[[ lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "--gcc-toolchain=/usr/bin"} ;
    };
  }
} ]]
