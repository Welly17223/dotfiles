return {
  "lervag/vimtex",
  ft = { "tex" }, -- lazy-loading will disable inverse search
  cmd = {
    "VimtexInverseSearch",
  },
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
      pattern = { "bib", "tex" },
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })

    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable "pplatex" == 1 and "pplatex" or "latexlog"
    vim.g.vimtex_view_method = "zathura"
    -- vim.g.vimtex_view_general_viewer = "zathura"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
    vim.g.vimtex_quickfix_mode = 0
  end,
}
