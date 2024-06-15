-- n, v, i, t = mode names

local M = {}

M.general = {
  n = {
    -- lsp --
    ["<leader>vrn"] = { function() vim.lsp.buf.rename() end , "rename a objects"},
    ["<leader>vca"] = { function() vim.lsp.buf.code_action() end , "See debug information"},
    -- call command --
    -- [";"] = { ":", "enter cmdline", opts = { nowait = true } },
    -- run c --
    ["<leader>cc"] = { ":w<CR>:!~/runc.sh %:p:t %:p:h<CR>", "Compile C language And Run" },
    -- run c++ --
    ["<leader>cp"] = { ":w<CR>:!~/runc++.sh %:p:t %:p:h<CR>", "Compile C++ language And Run" },
    -- compile latex --
    ["<leader>ct"] = { ":VimtexCompile<CR>:VimtexClean<CR>", "Compile latexfile and preview" },
    -- tagbar --
    ["<F8>"] = { ":SymbolsOutline<CR>" },
    --move line--
    ['<A-j>'] = { ":move +1<CR>" },
    ['<A-k>'] = { ":move -2<CR>" },

    ['<C-d>'] = { "<C-d>zz" },
    ['<C-u>'] = { "<C-u>zz" },
  },

  v = {
    -- [";"] = {":"},
    ["<A-j>"] = {":'<,'>move '>+1<CR>gv"},
    ["<A-k>"] = {":'<,'>move '<-2<CR>gv"},
  },

  i = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
    ["<C-h>"] = { function () vim.lsp.buf.signature_help() end },
  },

  s = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
  },

}


return M
