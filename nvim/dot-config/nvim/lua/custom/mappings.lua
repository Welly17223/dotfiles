-- n, v, i, t = mode names

local M = {}

M.general = {
  n = {
    -- lsp --
    ["<leader>vrn"] = { function() vim.lsp.buf.rename() end, "rename a objects", },
    ["<leader>vca"] = { function() vim.lsp.buf.code_action() end, "See debug information", },

    -- run c --
    ["<leader>cc"] = { "<cmd>w<CR>:!~/runc.sh %:p:t %:p:h<CR>", "Compile C language And Run" },

    -- run c++ --
    ["<leader>cp"] = { "<cmd>w<CR>:!~/runc++.sh %:p:t %:p:h<CR>", "Compile C++ language And Run" },

    -- compile latex --
    ["<leader>ct"] = { "<cmd>VimtexCompile<CR>:VimtexClean<CR>", "Compile latexfile and preview" },

    -- tagbar --
    ["<F8>"] = { "<cmd>SymbolsOutline<CR>" },

    -- move linei --
    ["<A-j>"] = { "<cmd>move +1<CR>" },
    ["<A-k>"] = { "<cmd>move -2<CR>" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    -- windows --
    ["<leader>q"] = { "<cmd>wincmd q<CR>", "close current windows" },
  },

  v = {
    -- [";"] = {"<cmd>"},
    ["<A-j>"] = { "<cmd>'<,'>move '>+1<CR>gv" },
    ["<A-k>"] = { "<cmd>'<,'>move '<-2<CR>gv" },
  },

  i = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
    ["<C-h>"] = { function() vim.lsp.buf.signature_help() end, },
  },

  s = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
  },
}

return M
