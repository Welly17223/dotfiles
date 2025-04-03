return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "lsp", "treesitter" },
    filter_kind = {
      "Array",
      "Boolean",
      "Class",
      "Constant",
      "Constructor",
      "Enum",
      "Event",
      "Field",
      "File",
      "Function",
      "Interface",
      "Key",
      "Method",
      "Module",
      "Namespace",
      "Number",
      "Object",
      "Operator",
      "Package",
      "Property",
      "Struct",
      "TypeParameter",
      "Variable",
    },
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    { "<leader>fx", "<cmd>Telescope aerial<CR>", desc = "Search Outline" },
  },
}
