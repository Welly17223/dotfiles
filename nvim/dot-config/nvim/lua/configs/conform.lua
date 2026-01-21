local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    latex = { "latexindent" },
    css = { "prettier" },
    html = { "prettier" },
    xml = { "xmlformatter" },
    yaml = { "yamlfmt" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    typst = { "typstyle" },
  },
  formatters = {},

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
