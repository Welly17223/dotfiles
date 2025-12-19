return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      NOTE = { alt = { "NOTE", "HINt", "Hint", "Note" } },
    },
    hightlight = {
      pattern = [[.*<(KEYWORDS)\s*(:|#| )]],
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      mode = { "n" },
      desc = "Next todo comment",
    },
    {
      "]t",
      mode = { "n" },
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next error/warning todo comment",
    },
  },
  lazy = false,
}
