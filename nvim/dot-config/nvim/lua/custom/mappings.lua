-- n, v, i, t = mode names

local M = {}

M.general = {
  n = {
    -- lsp --
    ["<leader>vrn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "rename a objects",
    },
    ["<leader>vca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "See debug information",
    },
    ["<leader>i"] = {
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      "toggle inlay hints",
    },
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "go to definition",
    },
    ["<leader>vd"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "go to declaration",
    },
    ["<leader>vi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "go to implementation",
    },
    ["<leader>vt"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "go to type definition",
    },
    ["<leader>vr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "go to references",
    },
    ["<leader>vh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "show hover information",
    },
    ["<leader>vs"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "show signature help",
    },
    ["<leader>vf"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "formatting",
    },
    ["<leader>vn"] = {
      function()
        vim.lsp.diagnostic.goto_next()
      end,
      "go to next diagnostic",
    },
    ["<leader>vp"] = {
      function()
        vim.lsp.diagnostic.goto_prev()
      end,
      "go to previous diagnostic",
    },
    ["<leader>vl"] = {
      function()
        vim.lsp.diagnostic.set_loclist()
      end,
      "set loclist",
    },
    ["<leader>vv"] = {
      function()
        vim.lsp.diagnostic.show_line_diagnostics()
      end,
      "show line diagnostics",
    },
    ["<leader>vc"] = {
      function()
        vim.lsp.diagnostic.show_cursor_diagnostics()
      end,
      "show cursor diagnostics",
    },
    ["<leader>vr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "show references",
    },
    ["<leader>va"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "show code actions",
    },
    ["<leader>vs"] = {
      function()
        vim.lsp.buf.signature_help()
      end, },

    -- run c --
    ["<leader>cc"] = { "<cmd>w<CR>:!~/runc.sh %:p:t %:p:h<CR>", "Compile C language And Run" },

    -- run c++ --
    ["<leader>cp"] = { "<cmd>w<CR>:!~/runc++.sh %:p:t %:p:h<CR>", "Compile C++ language And Run" },

    ["<F3>"] = {
      function()
        local x = vim.fn.input "say something: "
        print(x)
      end,
    },

    ["<F9>"] = {
      function()
        local x = vim.bo.filetype
        vim.cmd "w"
        if x == "c" then
          vim.cmd "!gcc %:p -o %:p:r -DAUTO"
          vim.cmd "!./%:r"
        elseif x == "cpp" then
          vim.cmd "!g++ %:p -o %:p:r -DAUTO"
          vim.cmd "!./%:r"
        elseif x == "python" then
          vim.cmd "!python %:p"
        elseif x == "sh" or x == "bash" or x == "zsh" then
          vim.cmd "!bash %:p"
        elseif x == "rust" then
          vim.cmd "!cargo run"
        elseif x == "lua" then
          vim.cmd "!lua %:p"
        else
          print(x, "isn't supported filetype.")
        end
      end,
      "get filetype",
    },

    -- compile latex --
    ["<leader>ct"] = { "<cmd>VimtexCompile<CR>:VimtexClean<CR>", "Compile latexfile and preview" },

    -- tagbar --
    -- ["<F8>"] = { "<cmd>SymbolsOutline<CR>" },

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
    ["<A-k>"] = { "<cmd>'<,'>move '<-1<CR>gv" },
  },

  i = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
    ["<C-h>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
    },
  },

  s = {
    ["<C-n>"] = { "<Plug>luasnip-next-choice" },
  },
}

return M
