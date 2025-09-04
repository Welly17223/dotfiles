-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspcg = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ltex_plus", "texlab", "cmake", "lemminx", "pylsp", "asm_lsp", "clangd", "volar" } --, "ansiblels" }
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

lspcg.bashls.setup {
  filetypes = { "sh", "bash", "zsh" },
}

lspcg.volar.setup {
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
  },
}

lspcg.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/welly/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin/",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
  settings = {
    typescript = {
      tsserver = {
        useSyntaxServer = false,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
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
