-- local autocmd = vim.api.nvim_create_autocmd()
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/usr/bin/python"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

require "plugins"

require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/lua/custom/snippet/" }
-- settings for Markdown
local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.relativenumber = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
