require "nvchad.options"

vim.g.vscode_snippets_path = "~/.config/nvim/lua/snippet/"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
--
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.relativenumber = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.termguicolors = true

