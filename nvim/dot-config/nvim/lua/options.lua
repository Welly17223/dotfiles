require "nvchad.options"

vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets/vs_code_style"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets/lua_snippets"

-- add yours here!

local o = vim.o
local bo = vim.bo
o.cursorlineopt = "both" -- to enable cursorline!
--
-- o.tabstop = 4
-- o.softtabstop = 4
-- o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.relativenumber = true
o.foldmethod = "manual"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
o.foldlevel = 99
o.termguicolors = true
o.breakindent = true
o.autoread = true
o.linebreak = true
o.cmdheight = 0
o.showcmdloc = "statusline"
-- o.lazyredraw = true
o.confirm = true
bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- o.list = true
-- o.listchars = "trail:·"

local function set_dynamic_scrolloff()
  local height = vim.api.nvim_win_get_height(0) -- 取得目前視窗的高度
  vim.opt.scrolloff = math.floor(height * 0.1) -- 設定 scrolloff 為 20% 的視窗高度
end

-- 在視窗大小改變時重新計算 scrolloff
vim.api.nvim_create_autocmd("VimResized", {
  callback = set_dynamic_scrolloff,
})

-- 在啟動時設定 scrolloff
set_dynamic_scrolloff()

vim.diagnostic.config {
  virtual_lines = {
    current_line = true,
  },
  virtual_text = true,
}
