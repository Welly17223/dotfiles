return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require "notify"
  end,
  lazy = false,
  opts = {},
}
