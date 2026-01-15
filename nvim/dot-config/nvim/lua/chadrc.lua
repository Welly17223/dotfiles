-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",

  hl_override = {
    ["@comment"] = { italic = true },
    CursorLine = {
      bg = {
        "black",
        "blue",
        8,
      },
    },
    Cursor = {
      bold = true,
    },
    -- ["@comment"] = { italic = true },
  },
  hl_add = {
    -- -@type Flash.Config
    FlashLabel = {
      bg = "#b30000",
    },
    St_Macro = { fg = "#98c379" },
    St_Cmd = { fg = "#282828" },
  },
}

M.ui = {
  statusline = {
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "cmd", "macro", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      cmd = function()
        return "%#StText# %S "
      end,
      macro = function()
        local recording_register = vim.fn.reg_recording()

        if recording_register == "" then
          return ""
        else
          return "%#St_Macro#  @" .. recording_register .. " "
        end
      end,
    },
  },
  cmp = {
    icons_left = true,
    style = "flat_light",
  },
}

return M
