local config = function()

  vim.g.startify_lists = {
    { type = "bookmarks", header = { "Bookmarks" } },
    { type = "sessions",  header = { "Sessions" } },
    { type = "commands",  header = { "Commands" } },
    { type = "files",     header = { "MRU" } },
    { type = "dir",       header = { "Commits in : " .. vim.fn.getcwd() } },
  }
  vim.g.startify_bookmarks = {
    { t = "~/.tmux.conf" },
    { z = "~/.zshrc" },
    { pl = "~/.config/nvim/lua/custom/plugins.lua" },
    { m = "~/.config/nvim/lua/custom/mappings.lua" },
    { lsp = "~/.config/nvim/lua/custom/configs/lspconfig.lua" },
    { ov = "~/.config/nvim/lua/custom/configs/overrides.lua" },
  }
  vim.g.startify_commands = {}
  vim.g.startify_files_number = 8

  vim.keymap.set("n", "<leader>s", ":Startify<CR>")
  vim.keymap.set("n", "<leader>bs", ":SSave<CR>")
  vim.keymap.set("n", "<leader>bd", ":SDelete<CR>")
  vim.keymap.set("n", "<leader>bc", ":SClose<CR>")
end

return config
