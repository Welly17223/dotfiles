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
  },
}

M.ui = {
  statusline = {
    separator_style = "round",
  },
  cmp = {
    icons_left = true,
    style = "flat_light",
  },
}

return M
