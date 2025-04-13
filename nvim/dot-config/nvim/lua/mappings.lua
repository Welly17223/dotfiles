require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("i", "jk", "<ESC>")

map("n", "<leader>q", "<cmd>wincmd q<cr>", { desc = "Close current window" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
