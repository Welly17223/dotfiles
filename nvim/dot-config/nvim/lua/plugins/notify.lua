return {
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
    end,
    lazy = false,
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
}
