local M = {}

M.treesitter = {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {
      "latex",
    }
  },
  ensure_installed = {
    "vim",
    "lua",
    -- "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
    "toml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- python --
    "pyright",
    "blue",

    -- rust --
    "rust-analyzer",

    -- arduino --
    "arduino-language-server",

    -- bash --
    "bash-language-server",

    --  --

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- latex --
    "grammarly-languageserver",
    "ltex-ls",
    "latxindent",
  },
}

M.dap = {
  ensure_installed = {
    "codelldeb",
  }
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
