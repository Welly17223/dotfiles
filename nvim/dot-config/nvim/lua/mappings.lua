require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("i", "jk", "<ESC>")

map("n", "<a-j>", "<cmd> move +1<CR>", { desc = "Move line down" })
map("n", "<a-k>", "<cmd> move -2<CR>", { desc = "Move line down" })
-- map("n", "<c-d>", "<c-d>zz", { desc = "Move line down" })
-- map("n", "<c-u>", "<c-u>zz", { desc = "Move line up" })

map("v", "<a-j>", "<cmd>'<'> move '>+1<CR>gv", { desc = "Move line down" })
map("v", "<a-k>", "<cmd>'<'> move '<-2<CR>gv", { desc = "Move line down" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
