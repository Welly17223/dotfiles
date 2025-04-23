require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("i", "jk", "<ESC>")

map("n", "<leader>q", "<cmd>wincmd q<cr>", { desc = "Close current window" })

unmap({ "n", "t" }, "<A-h>")
map({ "n", "t" }, "<A-f>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
