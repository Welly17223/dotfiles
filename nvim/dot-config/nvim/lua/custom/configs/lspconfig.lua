local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "cssls", "ts_ls", "html", "pyright", "lemminx", "vimls", "texlab", "cmake" }

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
  filetypes = { "zsh" },
}
lspconfig.jdtls.setup {
  cmd = { "jdtls" },
}
lspconfig.grammarly.setup {
  filetypes = { "markdown", "tex", "text" },
}

lspconfig.verible.setup {
  cmd = { "verible-verilog-ls", "--rules_config_search" },
  on_attach = on_attach,
}

lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cc", "arduino" },
}

lspconfig.arduino_language_server.setup {}

lspconfig.html.setup {
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript" },
}
lspconfig.ltex.setup {
  filetypes = { "latex", "tex", "markdown" },
  enabled = { "latex", "tex", "markdown" },
}
lspconfig.svlangserver.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name

    if path == "/path/to/project1" then
      client.config.settings.systemverilog = {
        includeIndexing = { "**/*.{sv,svh}" },
        excludeIndexing = { "test/**/*.sv*" },
        defines = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand = "/tools/verible-verilog-format",
      }
    elseif path == "/path/to/project2" then
      client.config.settings.systemverilog = {
        includeIndexing = { "**/*.{sv,svh}" },
        excludeIndexing = { "sim/**/*.sv*" },
        defines = {},
        launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
        formatCommand = "/tools/verible-verilog-format",
      }
    end

    client.notify "workspace/didChangeConfiguration"
    return true
  end,
}
