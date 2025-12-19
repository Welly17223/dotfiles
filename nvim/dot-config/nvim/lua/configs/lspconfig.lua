-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "ltex",
  "texlab",
  "cmake",
  "lemminx",
  "pylsp",
  "asm_lsp",
  "clangd",
  "vue_ls",
  "sourcekit",
  "gopls",
  "kotlin_lsp",
  "grammarly",
  "bashls",
  "vue_ls",
  "ts_ls",
  "arduino_language_server",
  "tinymist",
} --, "ansiblels" }

vim.lsp.enable(servers)

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
vim.lsp.config("grammarly", {
  filetypes = { "markdown", "tex" },
})

vim.lsp.config("bashls", {
  filetypes = { "sh", "bash", "zsh" },
})

vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },
})

vim.lsp.config("vue_ls", {
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
})

vim.lsp.config("ts_ls", {
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
})

vim.lsp.config("arduino_language_server", {
  cmd = {
    vim.fn.expand "~/.local/share/nvim/mason/bin/arduino-language-server",
    "-clangd",
    "clangd",
    "-cli",
    "/usr/bin/arduino-cli",
    "-cli-config",
    vim.fn.expand "~/.arduino15/arduino-cli.yaml",
  },
})
