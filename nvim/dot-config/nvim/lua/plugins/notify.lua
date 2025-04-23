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
      lsp = {
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        progress = {
          enabled = false,
        },
      }
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
}
